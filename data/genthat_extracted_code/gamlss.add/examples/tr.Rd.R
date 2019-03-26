library(gamlss.add)


### Name: tr
### Title: A interface function to use rpart() function within GAMLSS
### Aliases: tr gamlss.tr
### Keywords: regression

### ** Examples

data(rent)
#--- fitting gamlss+tree Nornal
library(rpart)
data(rent)
rg1 <- gamlss(R ~ tr(~A+Fl), data=rent, family=NO)
plot(rg1)
plot(getSmo(rg1))
text(getSmo(rg1))
## Not run: 
##D # fitting Gamma  errors
##D rg2 <- gamlss(R ~ tr(~A+Fl), data=rent, family=GA)
##D plot(rg2)
##D plot(getSmo(rg2))
##D text(getSmo(rg2))
##D #--- fitting also model in the variance
##D rg3 <- gamlss(R ~ tr(~A+Fl), sigma.fo=~tr(~Fl+A), data=rent, 
##D                 family=GA, gd.tol=100, c.crit=0.1)
##D plot(rg3)
##D plot(getSmo(rg3))
##D text(getSmo(rg3))
##D plot(getSmo(rg3, what="sigma"))
##D text(getSmo(rg3, what="sigma"))
## End(Not run)



