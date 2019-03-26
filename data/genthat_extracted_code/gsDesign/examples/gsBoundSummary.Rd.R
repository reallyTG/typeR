library(gsDesign)


### Name: gsBoundSummary
### Title: 2.8: Bound Summary and Z-transformations
### Aliases: gsBoundSummary print.gsDesign summary.gsDesign
###   print.gsBoundSummary xprint gsBValue gsDelta gsHR gsRR gsCPz
###   'gsDesign print, summary and table summary functions'
### Keywords: design

### ** Examples

# survival endpoint using gsSurv
# generally preferred over nSurv since time computations are shown
xgs <- gsSurv(lambdaC=.2, hr=.5, eta=.1, T=2, minfup=1.5)
gsBoundSummary(xgs,timename="Year",tdigits=1)
summary(xgs)

# survival endpoint using nSurvival
# NOTE: generally recommend gsSurv above for this!
ss <- nSurvival(lambda1=.2 , lambda2=.1, eta = .1, Ts = 2, Tr = .5,
                sided=1, alpha=.025, ratio=2)
xs <- gsDesign(nFixSurv=ss$n,n.fix=ss$nEvents, delta1=log(ss$lambda2/ss$lambda1))
gsBoundSummary(xs,logdelta=TRUE, ratio=ss$ratio)
# generate some of the above summary statistics for the upper bound
z <- xs$upper$bound
# B-values
gsBValue(z=z, i=1:3, x=xs)
# hazard ratio
gsHR(z=z, i=1:3, x=xs)
# conditional power at observed treatment effect
gsCPz(z=z[1:2], i=1:2, x=xs)
# conditional power at H1 treatment effect
gsCPz(z=z[1:2], i=1:2, x=xs, theta=xs$delta)

# information-based design
xinfo <- gsDesign(delta=.3,delta1=.3)
gsBoundSummary(xinfo, Nname="Information")

# show all available boundary descriptions
gsBoundSummary(xinfo, Nname="Information",exclude=NULL)

# add intermediate parameter value
xinfo <- gsProbability(d=xinfo, theta=c(0,.15,.3))
class(xinfo) # note this is still as gsDesign class object
gsBoundSummary(xinfo, Nname="Information")

# now look at a binomial endpoint; specify H0 treatment difference as p1-p2=.05
# now treatment effect at bound (say, thetahat) is transformed to 
# xp$delta0 + xp$delta1*(thetahat-xp$delta0)/xp$delta  
np <- nBinomial(p1=.15, p2=.10)
xp <- gsDesign(n.fix=np, endpoint="Binomial", delta1=.05)
summary(xp)
gsBoundSummary(xp,deltaname="p[C]-p[E]")
# estimate treatment effect at lower bound
# by setting delta0=0 (default) and delta1 above in gsDesign
# treatment effect at bounds is scaled to these differences
# in this case, this is the difference in event rates
gsDelta(z=xp$lower$bound, i=1:3, xp)

# binomial endpoint with risk ratio estimates
n.fix<-nBinomial(p1=.3, p2=.15, scale="RR")
xrr <- gsDesign(k=2,n.fix=n.fix,delta1=log(.15/.3),endpoint="Binomial")
gsBoundSummary(xrr,deltaname="RR",logdelta=TRUE)
gsRR(z=xp$lower$bound, i=1:3, xrr)
plot(xrr,plottype="RR")

# delta is odds-ratio: sample size slightly smaller than for relative risk or risk difference
n.fix<-nBinomial(p1=.3, p2=.15, scale="OR")
xOR <- gsDesign(k=2,n.fix=n.fix,delta1=log(.15/.3/.85*.7),endpoint="Binomial")
gsBoundSummary(xOR,deltaname="OR",logdelta=TRUE)

# for nice LaTeX table output, use xprint
xprint(xtable(gsBoundSummary(xOR, deltaname="OR", logdelta=TRUE), caption="Table caption."))



