library(gamlss.cens)


### Name: gen.cens
### Title: A Function to Generate Appropriate Functions to Be Used to Fit a
###   Censored Response variable in GAMLSS
### Aliases: gen.cens
### Keywords: distribution regression

### ** Examples

library(gamlss.dist)
data(lip)
gen.cens(WEI,type="interval") 
WEIic
gg1<- gamlss(y ~ poly(Tem,2)+poly(pH,2)+poly(aw,2), data=lip, 
     family=WEIic, c.crit=0.00001, n.cyc=200, trace=FALSE)



