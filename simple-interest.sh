#!/bin/bash

# Simple Interest Calculator
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "Enter the principal amount:"
read p

echo "Enter the rate of interest:"
read r

echo "Enter the time period:"
read t

if command -v bc >/dev/null 2>&1; then
    si=$(echo "scale=2; ($p * $r * $t) / 100" | bc)
elif command -v awk >/dev/null 2>&1; then
    si=$(awk -v p="$p" -v r="$r" -v t="$t" 'BEGIN { printf "%.2f\n", (p * r * t) / 100 }')
else
    si=$(expr $p \* $r \* $t / 100)
fi

echo "Simple Interest: $si"