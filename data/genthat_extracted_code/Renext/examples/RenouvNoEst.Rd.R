library(Renext)


### Name: RenouvNoEst
### Title: Define a 'renouvellement' model without estimation
### Aliases: RenouvNoEst

### ** Examples

##======================================================================
## Example from S. Coles' book, page 86 'rainfall data'.
## Note that the first parameter is here the rate 'lambda', and no the
## probability of exceedance as in Coles' book.
##======================================================================
estimate <- c(lambda = 152 / 48, scale = 7.44, shape = 0.184)          
cov <- matrix(c(4.9e-7 * (17531 / 48)^2,  0.0000,  0.0000,
                0.0000,  0.9180, -0.0655,
                0.0000, -0.0655,  0.0102),
              nrow = 3)
colnames(cov) <- rownames(cov) <- names(estimate)
renNE <- RenouvNoEst(threshold = 30, distname.y = "gpd",
                     pct.conf = c(95, 70),
                     estimate = estimate,
                     nb.OT = 152, cov = cov)
summary(renNE)
plot(renNE, main = "Daily rainfall data SW England", ylim = c(0, 400))





