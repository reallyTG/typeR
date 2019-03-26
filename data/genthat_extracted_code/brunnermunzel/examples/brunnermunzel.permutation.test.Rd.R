library(brunnermunzel)


### Name: brunnermunzel.permutation.test
### Title: permuted Brunner-Munzel test
### Aliases: brunnermunzel.permutation.test
###   brunnermunzel.permutation.test.default
###   brunnermunzel.permutation.test.formula
###   brunnermunzel.permutation.test.matrix
###   brunnermunzel.permutation.test.table

### ** Examples

## Hollander & Wolfe (1973), 29f.
## Hamilton depression scale factor measurements in 9 patients with
##  mixed anxiety and depression, taken at the first (x) and second
##  (y) visit after initiation of a therapy (administration of a
##  tranquilizer).
x <- c(1.83,  0.50,  1.62,  2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
y <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)

brunnermunzel.permutation.test(x, y)

##       permuted Brunner-Munzel Test
##
## data:  x and y
## p-value = 0.158

## Formula interface.
dat <- data.frame(
    value = c(x, y),
    group = factor(rep(c("x", "y"), c(length(x), length(y))),
                   levels = c("x", "y"))
)

brunnermunzel.permutation.test(value ~ group, data = dat)

##       permuted Brunner-Munzel Test
##
## data:  value by group
## p-value = 0.158


## Pain score on the third day after surgery for 14 patients under
## the treatment Y and 11 patients under the treatment N
## (see Brunner and Munzel, 2000; Neubert and Brunner, 2007).

Y <- c(1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 4, 1, 1)
N <- c(3, 3, 4, 3, 1, 2, 3, 1, 1, 5, 4)

## No test: 
brunnermunzel.permutation.test(Y, N)
## End(No test)

##       permuted Brunner-Munzel Test
##
## data:  Y and N
## p-value = 0.008038

## Formula interface.
dat <- data.frame(
    value = c(Y, N),
    group = factor(rep(c("Y", "N"), c(length(Y), length(N))),
                   levels = c("Y", "N"))
)

## No test: 
brunnermunzel.permutation.test(value ~ group, data = dat)
## End(No test)

##       permuted Brunner-Munzel Test
##
## data:  value by group
## p-value = 0.008038


## Matrix or Table interface.
##
dat1 <- matrix(c(4, 4, 2, 1, 5, 4), nr = 2, byrow = TRUE)
dat2 <- as.table(dat1)

brunnermunzel.permutation.test(dat1)  # matrix

##       permuted Brunner-Munzel Test
##
## data:  Group1 and Group2
## p-value = 0.1593

brunnermunzel.permutation.test(dat2)  # table

##       Brunner-Munzel Test
##
##       permuted Brunner-Munzel Test
##
## data:  A and B
## p-value = 0.1593




