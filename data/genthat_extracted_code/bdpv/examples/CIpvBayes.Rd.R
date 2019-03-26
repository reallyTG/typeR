library(bdpv)


### Name: CIpvBayes
### Title: Confidence intervals for negative and positive predictive values
###   in a case-control setting by simulation from the posterior
###   distribution.
### Aliases: CIpvBI CIpvBII
### Keywords: htest

### ** Examples


# example data: Stamey and Holt, Table 8 (page 108)
#	Diseased
# Test	D=1	D=0
# T=1	240	87
# T=0	178	288
#n1,n0:	418	375


# reproduce the results for the Bayes I method
# in Stamey and Holt (2010), Table 9, page 108

# assuming known prevalence 0.03 
# ppv 0.0591, 0.0860
# npv 0.9810, 0.9850
CIpvBI( x1=c(240,178), x0=c(87,288), pr=0.03)

# assuming known prevalence 0.04 
# ppv 0.0779, 0.1111
# npv 0.9745, 0.9800
CIpvBI( x1=c(240,178), x0=c(87,288), pr=0.04)

# compare with standard logit intervals
tab <- cbind( x1=c(240,178), x0=c(87,288))
tab
BDtest(tab, pr=0.03)
BDtest(tab, pr=0.04)


# reproduce the results for the Bayes II method 
# in Stamey and Holt (2010), Table 9, page 108

CIpvBII( x1=c(240,178), x0=c(87,288),  shapespr=c(16,486))

CIpvBII( x1=c(240,178), x0=c(87,288), shapespr=c(21,481))




