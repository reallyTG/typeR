library(verification)


### Name: roc.plot
### Title: Relative operating characteristic curve.
### Aliases: roc.plot roc.plot.default roc.plot.prob.bin
### Keywords: file

### ** Examples

# Data from Mason and Graham article.

a<- c(0,0,0,1,1,1,0,1,1,0,0,0,0,1,1)
b<- c(.8, .8, 0, 1,1,.6, .4, .8, 0, 0, .2, 0, 0, 1,1)
c<- c(.928,.576, .008, .944, .832, .816, .136, .584, .032, .016, .28, .024, 0, .984, .952)

A<- data.frame(a,b,c)
names(A)<- c("event", "p1", "p2")

## for model with ties
roc.plot(A$event, A$p1)

## for model without ties
roc.plot(A$event, A$p2)

### show binormal curve fit.

roc.plot(A$event, A$p2, binormal = TRUE)
## Not run: 
##D # icing forecast
##D 
##D data(prob.frcs.dat)
##D A <- verify(prob.frcs.dat$obs, prob.frcs.dat$frcst/100)
##D roc.plot(A, main = "AWG Forecast")
##D 
##D 
##D # plotting a ``prob.bin'' class object.
##D obs<- round(runif(100))
##D pred<- runif(100)
##D 
##D A<- verify(obs, pred, frcst.type = "prob", obs.type = "binary")
##D 
##D roc.plot(A, main = "Test 1", binormal = TRUE, plot = "both")
##D 
##D ## show confidence intervals.  MAY BE SLOW
##D roc.plot(A, threshold = seq(0.1,0.9, 0.1), main = "Test 1", CI = TRUE,
##D alpha = 0.1)
##D 
##D ###   example from forecast verification website. 
##D data(pop)
##D d <- pop.convert() ## internal function used to make binary observations for the pop figure.
##D ### note the use of bins = FALSE !!
##D  mod24 <- verify(d$obs_norain, d$p24_norain, bins = FALSE)
##D 
##D  mod48 <- verify(d$obs_norain, d$p48_norain, bins = FALSE)
##D 
##D roc.plot(mod24, plot.thres = NULL)
##D lines.roc(mod48, col = 2, lwd = 2)
##D leg.txt <- c("24 hour forecast", "48 hour forecast")
##D legend( 0.6, 0.4, leg.txt, col = c(1,2), lwd = 2)
## End(Not run)



