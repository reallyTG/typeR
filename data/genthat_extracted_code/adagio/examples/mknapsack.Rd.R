library(adagio)


### Name: mknapsack
### Title: Multiple 0-1 Knapsack Problem
### Aliases: mknapsack

### ** Examples

## Example 1: single knapsack
p <- c(15, 100, 90, 60, 40, 15, 10,  1)
w <- c( 2,  20, 20, 30, 40, 30, 60, 10)
cap <- 102
(is <- mknapsack(p, w, cap))
which(is$ksack == 1)
# [1] 1 2 3 4 6 , capacity 102 and total profit 280

## Example 2: multiple knapsack
p <- c(110, 150, 70, 80, 30, 5)
w <- c( 40,  60, 30, 40, 20, 5)
k <- c(65, 85)
is <- mknapsack(p, w, k)
# kps 1: 2,6; kps 2: 1,4; value: 345; backtracks: 14

## Example 3: multiple knapsack
p <- c(78, 35, 89, 36, 94, 75, 74, 79, 80, 16)
w <- c(18,  9, 23, 20, 59, 61, 70, 75, 76, 30)
k <- c(103, 156)
is <- mknapsack(p, w, k)
# kps 1: 1,3,6; kps 2: 4,5,9; value: 452; backtracks: 4 

##  Example 4: subset sum
p <- seq(2, 44, by = 2)^2
w <- p
is <- mknapsack(p, w, 2012)
sum((2 * which(is$ksack == 1))^2)

##  Example 5: maximize number of items
w <- seq(2, 44, by = 2)^2
p <- numeric(22) + 1
is <- mknapsack(p, w, 2012)



