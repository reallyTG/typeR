## ---- echo=F, message=F--------------------------------------------------
library(IDSpatialStats)

## ---- eval=FALSE---------------------------------------------------------
#  set.seed(123)
#  
#  # Exponential transmission kernel with mean = sd = 100
#  dist.func <- alist(n=1, a=1/100, rexp(n, a))
#  
#  # Simulate epidemic with constant R value
#  a <- sim.epidemic(R=1.5,
#                    gen.t.mean=7,
#                    gen.t.sd=2,
#                    min.cases=100,
#                    tot.generations=10,
#                    trans.kern.func=dist.func)
#  sim.plot(a)

## ---- echo=FALSE, fig.width=7.25, fig.height=4, cache=FALSE, message=F, fig.cap='\\label{fig:sim1} **Left:** the spatial distribution of simulated cases with the red cross showing the index case. **Right:** the simulated epidemic curve giving case counts over time'----
knitr::include_graphics('figs/sim1.png')

## ---- eval=FALSE---------------------------------------------------------
#  # Simulate epidemic with variable R value
#  R1 <- 2
#  R2 <- 0.5
#  tg <- 12
#  R.vec <- seq(R1, R2, (R2 - R1)/(tg - 1))
#  
#  a <- sim.epidemic(R=R.vec,
#                    gen.t.mean=7,
#                    gen.t.sd=2,
#                    min.cases=100,
#                    tot.generations=tg,
#                    trans.kern.func=dist.func)
#  sim.plot(a)

## ---- echo=FALSE, fig.width=7.25, fig.height=4, fig.cap='**Left:** the spatial distribution of simulated cases with the red cross showing the index case. **Right:** the epidemic curve for a simulation with an $R$ value decreasing from 2 to 0.5 over the course of the epidemic'----
knitr::include_graphics('figs/sim2.png')

## ---- eval=FALSE---------------------------------------------------------
#  case.times <- c(1,2,2,3,3)
#  g.x <- c(0, 2/3, 1/3, 0, 0) # must sum to 1
#  a <- est.wt.matrix.weights(case.times=case.times, gen.t.dist=g.x); a

## ---- eval=FALSE---------------------------------------------------------
#  b <- est.wt.matrix(case.times=case.times, gen.t.dist=g.x, basic.wt.weights=a)
#  b <- est.wt.matrix(case.times=case.times, gen.t.dist=g.x); b # both are equivalent

## ---- eval=FALSE---------------------------------------------------------
#  gen.time <- 1
#  n.gen <- round((max(case.times) - min(case.times)) / gen.time) + 1 # Number of generations
#  
#  c <- get.transdist.theta(wal.teun.mat=b,
#                           cases=case.times,
#                           gen.t.mean=gen.time,
#                           max.sep=n.gen*2)

## ---- eval=FALSE---------------------------------------------------------
#  d <- est.transdist.theta.weights(case.times=case.times,
#                                   n.rep=5,
#                                   gen.t.mean=gen.time,
#                                   t1=0,
#                                   t.density=g.x)

## ---- eval=FALSE---------------------------------------------------------
#  set.seed(123)
#  
#  dist.func <- alist(n=1, a=1/100, rexp(n, a))
#  
#  # Simulate epidemic
#  a <- sim.epidemic(R=2,
#                    gen.t.mean=7,
#                    gen.t.sd=2,
#                    min.cases=100,
#                    tot.generations=8,
#                    trans.kern.func=dist.func)
#  
#  # Estimate mean and standara deviation of transmission kernel
#  b <- est.transdist(epi.data=a,
#                     gen.t.mean=7,
#                     gen.t.sd=2,
#                     t1=0,
#                     max.sep=1e10,
#                     max.dist=1e10,
#                     n.transtree.reps=10)

## ---- eval=FALSE---------------------------------------------------------
#  b <- est.transdist.bootstrap.ci(epi.data=a,
#                                  gen.t.mean=7,
#                                  gen.t.sd=2,
#                                  t1=0,
#                                  max.sep=1e10,
#                                  max.dist=1e10,
#                                  n.transtree.reps=10,
#                                  boot.iter=10,
#                                  ci.low=0.025,
#                                  ci.high=0.975)

## ---- eval=FALSE---------------------------------------------------------
#  b <- est.transdist.bootstrap.ci(epi.data=a,
#                                  gen.t.mean=7,
#                                  gen.t.sd=2,
#                                  t1=0,
#                                  max.sep=1e10,
#                                  max.dist=1e10,
#                                  n.transtree.reps=10,
#                                  boot.iter=10,
#                                  ci.low=0.025,
#                                  ci.high=0.975,
#                                  parallel=TRUE,
#                                  n.cores=2)

## ---- eval=FALSE---------------------------------------------------------
#  # Estimate mean transmission kernel over time
#  b <- est.transdist.temporal(epi.data=a,
#                              gen.t.mean=7,
#                              gen.t.sd=2,
#                              t1=0,
#                              max.sep=1e10,
#                              max.dist=1e10,
#                              n.transtree.reps=5,
#                              mean.equals.sd=TRUE,
#                              parallel=FALSE)
#  
#  plot(b[,1], pch=19, col='grey', ylim=c(min(b[,1], na.rm=TRUE), max(b[,1], na.rm=TRUE)),
#       xlab='Time step', ylab='Estimated mean of transmission kernel')
#  abline(h=100, col='red', lty=2)
#  axis(3, 1:nrow(b), b[,2])
#  
#  low <- loess(b[,1] ~ as.vector(1:length(b[,1])))
#  low <- predict(low, newdata=data.frame(as.vector(1:length(b[,1]))))
#  lines(low, lwd=3, col='blue')

## ---- echo=FALSE, out.width='100%', fig.cap='Output from the `est.transdist.temporal` function showing the change in the mean transmission distance over the course of a simulated epidemic. Point estimates are plotted as grey circles and a loess smooth of the mean estimate is plotted with the blue line. Sample size is plotted on the top axis.'----
knitr::include_graphics('figs/td_temp.png')

## ---- eval=FALSE---------------------------------------------------------
#  nc <- parallel::detectCores() # use all available cores
#  
#  b <- est.transdist.temporal.bootstrap.ci(epi.data=a,
#                                             gen.t.mean=7,
#                                             gen.t.sd=2,
#                                             t1=0,
#                                             max.sep=1e10,
#                                             max.dist=1e10,
#                                             n.transtree.reps=10,
#                                             mean.equals.sd=TRUE,
#                                             boot.iter=10,
#                                             ci.low=0.025,
#                                             ci.high=0.975,
#                                             parallel=TRUE,
#                                             n.cores=nc)
#  
#    plot(b[,1], pch=19, col='grey', ylim=c(min(b[,1:3], na.rm=TRUE), max(b[,1:3], na.rm=TRUE)),
#         xlab='Time step', ylab='Estimated mean of transmission kernel')
#    abline(h=100, col='red', lty=2)
#    axis(3, 1:nrow(b), b[,4])
#  
#    low <- loess(b[,1] ~ as.vector(1:nrow(b)), span=1)
#    low <- predict(low, newdata=data.frame(as.vector(1:nrow(b))))
#    lines(low, lwd=3, col='blue')
#  
#    for(i in 2:3) {
#      low <- loess(b[,i] ~ as.vector(1:nrow(b)), span=1)
#      low <- predict(low, newdata=data.frame(as.vector(1:nrow(b))))
#      lines(low, lty=2, lwd=3, col='blue')
#    }

## ---- echo=FALSE, out.width='100%', fig.cap='Output from the `est.transdist.temporal.bootstrap.ci` function showing the change in the mean transmission distance over the course of a simulated epidemic. The point estimates are plotted as grey circles and a loess smooth of the mean estimate is plotted (blue line) along with its 95% bootstrapped confidence intervals (dashed blue lines). Sample size is plotted on the top axis.'----
knitr::include_graphics('figs/td_temp_ci.png')

## ---- eval=F-------------------------------------------------------------
#  library(sparr)
#  data(fmd)
#  fmd <- cbind(fmd$cases$x, fmd$cases$y, fmd$cases$marks)
#  
#  nc <- parallel::detectCores()
#  
#  # Estimate transmission distance with bootstrapped confidence intervals
#  ci <- est.transdist.bootstrap.ci(epi.data=fmd,
#                                   gen.t.mean=6.1,
#                                   gen.t.sd=4.6,
#                                   t1=0,
#                                   max.sep=1e10,
#                                   max.dist=1e10,
#                                   n.transtree.reps=10,
#                                   boot.iter=10,
#                                   ci.low=0.025,
#                                   ci.high=0.975,
#                                   parallel=TRUE,
#                                   n.cores=nc)
#  
#  # Change in transmission distance and its bootstrapped confidence intervals over time
#  tci <- est.transdist.temporal.bootstrap.ci(epi.data=fmd,
#                                             gen.t.mean=6.1,
#                                             gen.t.sd=4.6,
#                                             t1=0,
#                                             max.sep=1e10,
#                                             max.dist=1e10,
#                                             n.transtree.reps=10,
#                                             mean.equals.sd=FALSE,
#                                             boot.iter=10,
#                                             ci.low=0.025,
#                                             ci.high=0.975,
#                                             parallel=TRUE,
#                                             n.cores=nc)

## ---- echo=FALSE, out.width='100%', fig.cap='Output from the `est.transdist.temporal.bootstrap.ci` function showing the change in the mean transmission distance over the course of the 2001 foot-and-mouth disease epidemic among farms in the UK. The point estimates are plotted as grey circles and a loess smooth of the mean estimate is plotted (blue line) along with its 95% bootstrapped confidence intervals (dashed blue lines). Sample size is plotted on the top axis.'----
knitr::include_graphics('figs/fmd.png')

