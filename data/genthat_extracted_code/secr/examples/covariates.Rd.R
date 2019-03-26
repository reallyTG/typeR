library(secr)


### Name: covariates
### Title: Covariates Attribute
### Aliases: covariates covariates<-
### Keywords: manip

### ** Examples

## detector covariates
temptrap <- make.grid(nx = 6, ny = 8)
covariates (temptrap) <- data.frame(halfnhalf = 
    factor(rep(c("left","right"),c(24,24))) )
summary(covariates(temptrap))



