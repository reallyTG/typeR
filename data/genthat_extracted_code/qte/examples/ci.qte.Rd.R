library(qte)


### Name: ci.qte
### Title: ci.qte
### Aliases: ci.qte

### ** Examples

## Load the data
data(lalonde)

##Estimate the QTET of participating in the job training program;
##This is the no covariate case.  Note: Because individuals that participate
## in the job training program are likely to be much different than
## individuals that do not (e.g. less experience and less education), this
## method is likely to perform poorly at estimating the true QTET
q1 <- ci.qte(re78 ~ treat, x=NULL, data=lalonde.psid, se=FALSE,
 probs=seq(0.05,0.95,0.05))
summary(q1)

##This estimation controls for all the available background characteristics.
q2 <- ci.qte(re78 ~ treat,
 xformla=~age + I(age^2) + education + black + hispanic + married + nodegree,
 data=lalonde.psid, se=FALSE, probs=seq(0.05, 0.95, 0.05))
summary(q2)




