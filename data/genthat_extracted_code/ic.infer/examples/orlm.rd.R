library(ic.infer)


### Name: orlm
### Title: Functions for order restricted linear regression estimation and
###   testing
### Aliases: orlm orlm.lm orlm.default boot.orlm orlm.forboot.fixed
###   orlm.forboot coef.orlm plot.orlm print.orlm summary.orlm
### Keywords: htest models regression multivariate

### ** Examples

limo <- lm(swiss)
## restricted linear model with restrictions that
## - Education and Examination have same coefficient
## - Catholic and Infant.Mortality have non-negative coefficients
orlimo <- orlm(limo, ui=rbind(c(0,1,-1,0,0),c(0,0,0,1,0),c(0,0,0,0,1)), meq=1)
orlimo
plot(orlimo)
summary(orlimo)
## same model using index vector
orlimo <- orlm(limo, ui=rbind(c(1,-1,0,0),c(0,0,1,0),c(0,0,0,1)), index=3:6, meq=1)

## reduced number of bootstrap samples below reasonable size for example run time
orlimo <- orlm(limo, ui=rbind(c(1,-1,0,0),c(0,0,1,0),c(0,0,0,1)), 
    index=3:6, meq=1, boot=TRUE, B=100)
summary(orlimo)

## bootstrap considering data as fixed 
orlimof <- orlm(limo, ui=rbind(c(1,-1,0,0),c(0,0,1,0),c(0,0,0,1)), 
    index=3:6, meq=1, boot=TRUE, B=100, fixed=TRUE)
summary(orlimof, brief=TRUE)



