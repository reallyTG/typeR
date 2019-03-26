library(qtlmt)


### Name: sureEps
### Title: Epistasis in a SURE model
### Aliases: sureEps

### ** Examples

data(etrait)
x<- as.matrix(mdat-1/2)
y<- as.matrix(traits)[,1:3]
v<- list()
upper<- list()
for(k in 1:ncol(y)){
   v[[k]]<- numeric(0)
   upper[[k]]<- 1:ncol(x)
}
## Not run: 
##D o<- surStep(y, x, v=v, upper=upper, k=19, direction="both",
##D    iter=250, max.terms=250, steps=2000, tol=1e-12)
##D neps<- 6 # suppose there are 6 possible epistatic effects
##D oeps<- sureEps(y, x, o$v, k=qchisq(1-0.05/neps,1), direction="backward",
##D   iter=250, max.terms=200, steps=1000, tol=1e-12)
## End(Not run)



