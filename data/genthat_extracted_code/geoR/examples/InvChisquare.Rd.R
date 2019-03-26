library(geoR)


### Name: InvChisquare
### Title: The (Scaled) Inverse Chi-Squared Distribution
### Aliases: dinvchisq rinvchisq
### Keywords: distribution

### ** Examples

set.seed(1234); rinvchisq(5, df=2)
set.seed(1234); 1/rchisq(5, df=2)

set.seed(1234); rinvchisq(5, df=2, scale=5)
set.seed(1234); 5*2/rchisq(5, df=2)

## inverse Chi-squared is a particular case
x <- 1:10
all.equal(dinvchisq(x, df=2), dinvchisq(x, df=2, scale=1/2))



