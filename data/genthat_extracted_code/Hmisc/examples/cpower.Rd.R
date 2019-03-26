library(Hmisc)


### Name: cpower
### Title: Power of Cox/log-rank Two-Sample Test
### Aliases: cpower
### Keywords: htest survival

### ** Examples

#In this example, 4 plots are drawn on one page, one plot for each
#combination of noncompliance percentage.  Within a plot, the
#5-year mortality % in the control group is on the x-axis, and
#separate curves are drawn for several % reductions in mortality
#with the intervention.  The accrual period is 1.5y, with all
#patients followed at least 5y and some 6.5y.


par(mfrow=c(2,2),oma=c(3,0,3,0))


morts <- seq(10,25,length=50)
red <- c(10,15,20,25)


for(noncomp in c(0,10,15,-1)) {
  if(noncomp>=0) nc.i <- nc.c <- noncomp else {nc.i <- 25; nc.c <- 15}
  z <- paste("Drop-in ",nc.c,"%, Non-adherence ",nc.i,"%",sep="")
  plot(0,0,xlim=range(morts),ylim=c(0,1),
           xlab="5-year Mortality in Control Patients (%)",
           ylab="Power",type="n")
  title(z)
  cat(z,"\n")
  lty <- 0
  for(r in red) {
        lty <- lty+1
        power <- morts
        i <- 0
        for(m in morts) {
          i <- i+1
          power[i] <- cpower(5, 14000, m/100, r, 1.5, 5, nc.c, nc.i, pr=FALSE)
        }
        lines(morts, power, lty=lty)
  }
  if(noncomp==0)legend(18,.55,rev(paste(red,"% reduction",sep="")),
           lty=4:1,bty="n")
}
mtitle("Power vs Non-Adherence for Main Comparison",
           ll="alpha=.05, 2-tailed, Total N=14000",cex.l=.8)
#
# Point sample size requirement vs. mortality reduction
# Root finder (uniroot()) assumes needed sample size is between
# 1000 and 40000
#
nc.i <- 25; nc.c <- 15; mort <- .18
red <- seq(10,25,by=.25)
samsiz <- red


i <- 0
for(r in red) {
  i <- i+1
  samsiz[i] <- uniroot(function(x) cpower(5, x, mort, r, 1.5, 5,
                                          nc.c, nc.i, pr=FALSE) - .8,
                       c(1000,40000))$root
}


samsiz <- samsiz/1000
par(mfrow=c(1,1))
plot(red, samsiz, xlab='% Reduction in 5-Year Mortality',
	 ylab='Total Sample Size (Thousands)', type='n')
lines(red, samsiz, lwd=2)
title('Sample Size for Power=0.80\nDrop-in 15%, Non-adherence 25%')
title(sub='alpha=0.05, 2-tailed', adj=0)



