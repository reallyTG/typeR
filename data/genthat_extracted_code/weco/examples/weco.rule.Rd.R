library(weco)


### Name: weco.rule
### Title: Individual WECO Rule
### Aliases: weco.rule

### ** Examples


x <- rnorm(1000);

## use empirical mean and standard deviation of x
rst.1 <- weco.rule(1, x, l=3);
rst.2 <- weco.rule(2, x, k=9);
rst.3 <- weco.rule(3, x, k=6);
rst.4 <- weco.rule(4, x, k=16);
rst.5 <- weco.rule(5, x, k=2, n=3, l=2);
rst.6 <- weco.rule(6, x, k=4, n=5, l=1);
rst.7 <- weco.rule(7, x, k=15, l=1);
rst.8 <- weco.rule(8, x, k=8, l=1);

## use given mean and standard deviation
rst.1 <- weco.rule(1, x, l=3, mux=0, sdx=1);




