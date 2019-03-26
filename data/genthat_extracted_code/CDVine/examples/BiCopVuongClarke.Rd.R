library(CDVine)


### Name: BiCopVuongClarke
### Title: Scoring goodness-of-fit test based on Vuong and Clarke tests for
###   bivariate copula data
### Aliases: BiCopVuongClarke

### ** Examples

# simulate from a t-copula
dat = BiCopSim(500,2,0.7,5)

# apply the test for families 1-10
## Not run: 
##D vcgof = BiCopVuongClarke(dat[,1],dat[,2],familyset=c(1:10))
##D 
##D # display the Vuong test scores
##D vcgof[1,]
## End(Not run)



