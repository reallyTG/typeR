library(pomp)


### Name: Probes and synthetic likelihood
### Title: Probe a partially-observed Markov process by computing summary
###   statistics and the synthetic likelihood.
### Aliases: 'Probes and synthetic likelihood' probe probe,missing-method
###   probe,ANY-method probe,pomp-method probe,probed.pomp-method
###   probe-pomp probe-probed.pomp probe.match probe.match,ANY-method
###   probe.match,missing-method probe.match,pomp-method
###   probe.match,probed.pomp-method probe.match,probe.matched.pomp-method
###   probe.match-pomp probe.match-probed.pomp
###   probe.match-probe.matched.pomp probed.pomp-class
###   probe.matched.pomp-class probe.match.objfun
###   probe.match.objfun,ANY-method probe.match.objfun,missing-method
###   probe.match.objfun,pomp-method probe.match.objfun,probed.pomp-method
###   probe.match.objfun-pomp probe.match.objfun-probed.pomp
###   probed.pomp-methods probe.matched.pomp-methods spect.pomp-methods
###   spect.matched.pomp-methods summary,probed.pomp-method
###   summary,probe.matched.pomp-method summary-probed.pomp
###   summary-probe.matched.pomp values values,probed.pomp-method
###   values,probe.matched.pomp-method values-probed.pomp
###   values-probe.matched.pomp plot,probed.pomp-method
###   plot,probe.matched.pomp-method plot-probed.pomp
###   plot-probe.matched.pomp summary,spect.pomp-method
###   summary,spect.matched.pomp-method summary-spect.pomp
###   summary-spect.matched.pomp plot,spect.pomp-method
###   plot,spect.matched.pomp-method plot,spect.pomp-method plot-spect.pomp
###   as,probed.pomp-method logLik,probed.pomp-method logLik-probed.pomp
###   $,probed.pomp-method $-probed.pomp $,probe.matched.pomp-method
###   $-probe.matched.pomp coerce,probed.pomp,data.frame-method
### Keywords: optimize ts

### ** Examples

pompExample(ou2)
good <- probe(
              ou2,
              probes=list(
                y1.mean=probe.mean(var="y1"),
                y2.mean=probe.mean(var="y2"),
                y1.sd=probe.sd(var="y1"),
                y2.sd=probe.sd(var="y2"),
                extra=function(x)max(x["y1",])
                ),
              nsim=300
              )
summary(good)
plot(good)

bad <- probe(
             ou2,
             params=c(alpha.1=0.1,alpha.4=0.2,x1.0=0,x2.0=0,
                      alpha.2=-0.5,alpha.3=0.3,
                      sigma.1=3,sigma.2=-0.5,sigma.3=2,
                      tau=1),
             probes=list(
               y1.mean=probe.mean(var="y1"),
               y2.mean=probe.mean(var="y2"),
               y1.sd=probe.sd(var="y1"),
               y2.sd=probe.sd(var="y2"),
               extra=function(x)range(x["y1",])
               ),
             nsim=300
             )
summary(bad)
plot(bad)



