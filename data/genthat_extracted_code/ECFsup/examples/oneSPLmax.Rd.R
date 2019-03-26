library(ECFsup)


### Name: oneSPLmax
### Title: oneSPL of sup-norm test
### Aliases: oneSPLmax

### ** Examples

p <- 100; sample_num <- c(40,60); k <- length(sample_num); n <- sum(sample_num);
odata <- matrix(rnorm(p*n),p,n);
oneSPL(odata, sample_num, k, p, n);



