## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(dplyr)
library(tidyr)
library(matsbyname)
# library(matsindf)

## ------------------------------------------------------------------------
productnames <- c("p1", "p2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames))
U
Y <- matrix(1:4, ncol = 2, dimnames = list(rev(productnames), rev(industrynames)))
Y
# This sum is nonsensical.  Neither row nor column names are respected.
U + Y 

## ------------------------------------------------------------------------
# Make a new version of Y (Y2), this time with dimnames in same order as U
Y2 <- matrix(4:1, ncol = 2, dimnames = list(productnames, industrynames))
Y2
# Now the sum is sensible. Both row and column names are respected.
U + Y2

## ------------------------------------------------------------------------
Y3 <- matrix(5:8, ncol = 2, dimnames = list(c("p1", "p3"), c("i1", "i3")))
Y3
# Nonsensical because neither row nor column names are respected. 
# The "p3" rows and "i3" columns of Y3 have been added to 
# "p2" rows and "i2" columns of U.
# Row and column names for the sum are taken from the first operand (U).
U + Y3
# Rather, need to insert missing rows in both U and Y before summing.
U_2000 <- matrix(c(1, 3, 0,
                   2, 4, 0,
                   0, 0, 0),
                 ncol = 3, byrow = TRUE, 
                 dimnames = list(c("p1", "p2", "p3"), c("i1", "i2", "i3")))
Y_2000 <- matrix(c(5, 0, 7,
                   0, 0, 0, 
                   6, 0, 8),
                 ncol = 3, byrow = TRUE,
                 dimnames = list(c("p1", "p2", "p3"), c("i1", "i2", "i3")))
U_2000
Y_2000
U_2000 + Y_2000

## ------------------------------------------------------------------------
# The original U matrix is invertible.
solve(U)
# The version of U that contains zero rows and columns (U_2000)
# is singular and cannot be inverted.
tryCatch(solve(U_2000), error = function(err){print(err)})

## ------------------------------------------------------------------------
# Same as U + Y2, without needing to create Y2.
sum_byname(U, Y)
# Same as U_2000 + Y_2000, but U and Y3 are unmodified.
sum_byname(U, Y3)
# Eliminate zero-filled rows and columns. Same result as solve(U).
U_2000 %>% clean_byname(margin = c(1,2), clean_value = 0) %>% solve()

## ------------------------------------------------------------------------
U_2 <- matrix(1:4, ncol = 2) %>% 
  setrownames_byname(productnames) %>% setcolnames_byname(industrynames)
U_2

## ------------------------------------------------------------------------
A <- matrix(1:4, ncol = 2) %>% 
  setrownames_byname(productnames) %>% setcolnames_byname(industrynames) %>% 
  setrowtype("Products") %>% setcoltype("Industries")
A
B <- matrix(8:5, ncol = 2) %>% 
  setrownames_byname(productnames) %>% setcolnames_byname(industrynames) %>% 
  setrowtype("Products") %>% setcoltype("Industries")
B
C <- matrix(1:4, ncol = 2) %>% 
  setrownames_byname(industrynames) %>% setcolnames_byname(productnames) %>% 
  setrowtype("Industries") %>% setcoltype("Products")
C

## ------------------------------------------------------------------------
sum_byname(A, B)

## ------------------------------------------------------------------------
tryCatch(sum_byname(A, C), error = function(err){print(err)})

## ------------------------------------------------------------------------
sum_byname(A, transpose_byname(C))

## ------------------------------------------------------------------------
hadamardproduct_byname(A, B)
quotient_byname(A, B)

## ------------------------------------------------------------------------
matrixproduct_byname(A, C)

## ------------------------------------------------------------------------
tryCatch(matrixproduct_byname(A, B), error = function(err){print(err)})

## ------------------------------------------------------------------------
sum_byname(A, list(B, B))
hadamardproduct_byname(list(A, A), B)
matrixproduct_byname(list(A, A), list(C, C))

