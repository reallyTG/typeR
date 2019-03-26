library(PubBias)


### Name: plot_chase_observed_expected
### Title: From a meta-analysis, analyse for publication bias.  Calculates
###   observed and expected number of positive studies and P for
###   difference.
### Aliases: plot_chase_observed_expected

### ** Examples

data("BMort") ## Meta-analysis of statin use (Brugts 2009, BMJ)
 Btmort<-with(BMort, plot_chase_observed_expected(r_events_control,
   r_events_treated, n_sample_size_control, n_sample_size_treated, n=10,
   low.alpha=.001, high.alpha=0.3, by.alpha=0.01))
plot(Btmort$alpha, Btmort$observed,  type="l", las=1, lwd=2, xlim=c(.0001,0.3),
   xlab=c("Significance level"),  #### Brugts study mortality outcome; n set low for speed.
   ylab=c(""), main=c("(a) Brugts; all-cause mortality."))
lines(Btmort$alpha,Btmort$observed)
lines(Btmort$alpha,Btmort$expected, lty=3)
abline(v=0.05, lty=2)
par(new=TRUE)
plot(Btmort$alpha, Btmort$p.value, type="l", xlab="",lty=4,lwd=2,
col="grey", axes=FALSE, ylab="")
abline(h=0.1, lty=2)
axis(4,las=1)
mtext(side=4,line=2.5,"P for difference")



