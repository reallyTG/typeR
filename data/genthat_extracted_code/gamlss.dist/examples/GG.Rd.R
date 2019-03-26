library(gamlss.dist)


### Name: GG
### Title: Generalized Gamma distribution for fitting a GAMLSS
### Aliases: GG pGG dGG qGG rGG
### Keywords: distribution regression

### ** Examples

y<-rGG(100,mu=1,sigma=0.1, nu=-.5) # generates 100 random observations  
hist(y)
# library(gamlss)
#histDist(y, family=GG)
#m1 <-gamlss(y~1,family=GG)
#prof.dev(m1, "nu", min=-2, max=2, step=0.2)



