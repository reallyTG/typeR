library(REEMtree)


### Name: REEMtree
### Title: Create a RE-EM tree
### Aliases: REEMtree
### Keywords: tree models

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)

# Estimation allowing for autocorrelation
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID, 
	correlation=corAR1())

# Random parameters model for the random effects
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1+X|ID)

# Estimation with a subset
sub <- rep(c(rep(TRUE, 10), rep(FALSE, 2)), 50)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID, 
	subset=sub)

# Dataset from the R library "AER"
data("Grunfeld", package = "AER")
REEMtree(invest ~ value + capital, data=Grunfeld, random=~1|firm)
REEMtree(invest ~ value + capital, data=Grunfeld, random=~1|firm, correlation=corAR1())
REEMtree(invest ~ value + capital, data=Grunfeld, random=~1+year|firm)
REEMtree(invest ~ value + capital, data=Grunfeld, random=~1|firm/year)




