library(QCA)


### Name: PI chart functions: makeChart, findmin, solveChart
### Title: Create and solve a prime implicants chart
### Aliases: makeChart findmin solveChart
### Keywords: functions

### ** Examples


# non-standard products, it needs the set names
chart <- makeChart("A, B, c", "ABC, Abc, AbC, aBc", snames =  "A,B,C")
chart
#   ABC Abc AbC aBc
# A  x   x   x   - 
# B  x   -   -   x 
# c  -   x   -   x 

findmin(chart)
# 2

solveChart(chart)
# first and second rows (A + B)
# and first and third rows (A + c)
# A is an essential prime implicant
#      A + B  A + c
#      [,1]   [,2]
# [1,]    1      1
# [2,]    2      3


# Quine's example, page 528
rows <- "AB, BC, Ac, aC, abd, bcd"
cols <- "ABCD, ABCd, ABcD, ABcd, AbcD, Abcd, aBCD, aBCd, abCD, abCd, abcd"

chart <- makeChart(rows, cols, "A,B,C,D")
chart
#     ABCD ABCd ABcD ABcd AbcD Abcd aBCD aBCd abCD abCd abcd
# AB   x    x    x    x    -    -    -    -    -    -    -  
# BC   x    x    -    -    -    -    x    x    -    -    -  
# Ac   -    -    x    x    x    x    -    -    -    -    -  
# aC   -    -    -    -    -    -    x    x    x    x    -  
# abd  -    -    -    -    -    -    -    -    -    x    x  
# bcd  -    -    -    -    -    x    -    -    -    -    x 

findmin(chart)
# 4

solveChart(chart)
#      [,1] [,2] [,3] [,4]
# [1,]    1    1    2    2
# [2,]    3    3    3    3
# [3,]    4    4    4    4
# [4,]    5    6    5    6


# using SOP standard product sign
rows <- "EF, ~GH, IJ"
cols <- "~EF*~GH*IJ, EF*GH*~IJ, ~EF*GH*IJ, EF*~GH*~IJ"
chart <- makeChart(rows, cols)
chart
#     ~EF*~GH*IJ EF*GH*~IJ ~EF*GH*IJ EF*~GH*~IJ
# EF      -          x         -         x     
# ~GH     x          -         -         x     
# IJ      x          -         x         -     

solveChart(chart)
# ~GH is redundant
#     EF + IJ
#      [,1]
# [1,]    1
# [2,]    3


# using implicant matrices
primes <- matrix(c(2,2,1,0,2,2,0,2,2,2), nrow = 2)
configs <- matrix(c(2,2,2,1,1,2,2,2,2,1,2,2,2,2,2), nrow = 3)
colnames(primes) <- colnames(configs) <- LETTERS[1:5]

# the prime implicants: AbCE and ACDE
primes
#      A B C D E
# [1,] 2 1 2 0 2
# [2,] 2 0 2 2 2

# the initial causal combinations: AbCdE, AbCDE and ABCDE
configs
#      A B C D E
# [1,] 2 1 2 1 2
# [2,] 2 1 2 2 2
# [3,] 2 2 2 2 2

chartLC <- makeChart(primes, configs)
chartLC
#      AbCdE AbCDE ABCDE
# AbCE   x     x     -  
# ACDE   -     x     x




