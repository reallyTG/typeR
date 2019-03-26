library(Brobdingnag)


### Name: Brobdingnag-package
### Title: Very Large Numbers in R
### Aliases: Brobdingnag-package Brobdingnag
### Keywords: package

### ** Examples

googol <- as.brob(10)^100

googol
googol + googol/2

1/(googol + 1e99)

(1:10)^googol

googolplex <- 10^googol

googolplex

googolplex * googol  # practically the same as googolplex (!)






