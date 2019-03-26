library(pampe)


### Name: pampe
### Title: Implementation of the Panel Data Approach for Program Evaluation
### Aliases: pampe plot.pampe summary.pampe print.summary.pampe
###   xtable.pampe

### ** Examples

##Load the sample dataset
data(growth)

##First we apply the method to the political integration of Hong Kong
##as was done by Hsiao et al. (2012) using AICc as selection criteria
treated         <- "HongKong"
time.pretr      <- 1:18
time.tr         <- 19:44
possible.ctrls  <- c('China','Indonesia','Japan','Korea','Malaysia','Philippines',
'Singapore','Taiwan','UnitedStates','Thailand')

##Call the function
pol.integ <- pampe(time.pretr=time.pretr, time.tr=time.tr, treated=treated,
controls=possible.ctrls, data=growth)

##The function automatically prints out a summary of the optimal model
##or we can call it ourselves
summary(pol.integ)

##The method plot() works on object of class pampe to produce a plot of the actual evolution
##of the treated unit together with the predicted counterfactual path.
##A simple plot call to our saved pampe object would give us the desired plot
plot(pol.integ)

##User-generated plot
##A plot of the estimated counterfactual together with the actual outcome
matplot(c(time.pretr, time.tr),cbind(growth[c(time.pretr, time.tr),1], pol.integ$counterfactual),
type="l", ylab="GDP growth", xlab="", ylim=c(-0.15,0.15), col=1, lwd=3, xaxt="n")
axis(1, at=c(time.pretr, time.tr)[c(seq(2, length(c(time.pretr, time.tr)), by=2))],
labels=c(rownames(growth)[c(time.pretr, time.tr)[c(seq(2, length(c(time.pretr, time.tr)),
by=2))]]), las=3)
title(xlab="Quarter",mgp=c(3.6,0.5,0))
legend("bottomright",c("Hong Kong", "predicted Hong Kong"), col=1, lty=c(1,2), lwd=3)
abline(v=time.pretr[length(time.pretr)],lty=3, lwd=3)

##Now we include placebo tests
pol.integ.placebos <- pampe(time.pretr=time.pretr, time.tr=time.tr, treated=treated,
controls=possible.ctrls, data=growth, placebos="Both")

##We can use the plot method again and check the results in the viewer
plot(pol.integ.placebos)

##Or create user-generated plots
##Plot of the placebos-controls
mspe <- pol.integ.placebos$placebo.ctrl$mspe
linewidth  <- matrix(2, 1, ncol(mspe)-1)
linewidth <- append(linewidth, 5, after = 0)

matplot(c(time.pretr, time.tr), pol.integ.placebos$placebo.ctrl$tr.effect,
type="l", xlab="", ylab="GDP growth gap", col=c("red",matrix(1, 1, ncol(mspe)-1)),
lty=c(1,matrix(2, 1, ncol(mspe)-1)), lwd=linewidth, ylim=c(-0.35,0.2), , xaxt="n")
axis(1, at=c(time.pretr, time.tr)[c(seq(4, length(c(time.pretr, time.tr)), by=4))],
labels=c(rownames(growth)[c(time.pretr, time.tr)[c(seq(4, length(c(time.pretr, time.tr)),
by=4))]]), las=3)
title(xlab="Quarter",mgp=c(3.6,0.5,0))
legend("topleft",c("Hong Kong", "Controls"),col=c("red", 1),lty=c(1,2),lwd=c(5,2))
abline(h=0,lty=3, lwd=3)
abline(v=time.pretr[length(time.pretr)],lty=3, lwd=3)
## The estimated effect for Hong Kong does not appear to be significant
##since it is not an outlier

##Plot of the placebos-in-time 
##For example let's plot the first reassignment
placebo.in.time1 <- pol.integ.placebos$placebo.time$tr.effect[,2]+growth[c(time.pretr, time.tr),1]
matplot(c(time.pretr, time.tr),cbind(growth[c(time.pretr, time.tr),1],
pol.integ.placebos$counterfactual, placebo.in.time1), type="l", ylab="GDP growth",
xlab="", ylim=c(-0.25,0.2), col=1, lwd=3, xaxt="n")
axis(1, at=c(time.pretr, time.tr)[c(seq(4, length(c(time.pretr, time.tr)), by=4))],
labels=c(rownames(growth)[c(time.pretr, time.tr)[c(seq(4, length(c(time.pretr, time.tr)),
by=4))]]), las=3)
title(xlab="Quarter",mgp=c(3.6,0.5,0))
legend("bottomleft",c("actual", "predicted", paste("placebo",
colnames(pol.integ.placebos$placebo.time$tr.effect)[2], sep=" ")), col=1, lty=c(1,2,3), lwd=3)
abline(v=time.pretr[length(time.pretr)],lty=2, lwd=3)
abline(v=which(colnames(pol.integ.placebos$placebo.time$tr.effect)[2]==rownames(growth)),
lty=3, lwd=3)


##We can also plot the gaps all at the same time
mspe <- pol.integ.placebos$placebo.time$mspe
linewidth  <- matrix(2, 1, ncol(mspe)-1)
linewidth <- append(linewidth, 5, after = 0)

matplot(c(time.pretr, time.tr), pol.integ.placebos$placebo.time$tr.effect,
type="l", xlab="", ylab="GDP growth gap", col=c("red",matrix(1, 1, ncol(mspe)-1)),
lty=c(1,matrix(2, 1, ncol(mspe)-1)), lwd=linewidth, ylim=c(-0.35,0.2), , xaxt="n")
axis(1, at=c(time.pretr, time.tr)[c(seq(4, length(c(time.pretr, time.tr)), by=4))],
labels=c(rownames(growth)[c(time.pretr, time.tr)[c(seq(4, length(c(time.pretr, time.tr)),
by=4))]]), las=3)
title(xlab="Quarter",mgp=c(3.6,0.5,0))
legend("topleft",c("Hong Kong", "Controls"),col=c("red", 1),lty=c(1,2),lwd=c(5,2))
abline(h=0,lty=3, lwd=3)
##Not significant either

##Leave-one-out robustness check
robust <- robustness(pol.integ)
plot(robust)



