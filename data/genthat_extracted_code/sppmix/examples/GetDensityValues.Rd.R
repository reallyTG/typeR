library(sppmix)


### Name: GetDensityValues
### Title: Retrieve density values
### Aliases: GetDensityValues

### ** Examples

## No test: 
# create the true mixture intensity surface
truesurf =normmix(ps=c(.2, .6,.2), mus=list(c(0.3, 0.3), c(0.7, 0.7),
 c(0.5, 0.5)),sigmas=list(.01*diag(2), .01*diag(2), .01*diag(2)),
 lambda=100,win=spatstat::square(1))
plot(truesurf)
# generate the point pattern, truncate=TRUE by default
genPP=rsppmix(truesurf,truncate=FALSE)
fit=est_mix_damcmc(pp = genPP, m = 3)
allvals=GetDensityValues(fit)
MAPest=GetMAPEst(fit,vals=allvals)
plot(MAPest,main="IPPP intensity surface of MAP estimates")
## End(No test)




