library(Hmisc)


### Name: event.history
### Title: Produces event.history graph for survival data
### Aliases: event.history
### Keywords: survival

### ** Examples

# Code to produce event history graphs for SIM paper
#
# before generating plots, some pre-processing needs to be performed,
#  in order to get dataset in proper form for event.history function;
#  need to create one line per subject and sort by time under observation, 
#  with those experiencing event coming before those tied with censoring time;
require('survival')
data(heart)

# creation of event.history version of heart dataset (call heart.one):

heart.one <- matrix(nrow=length(unique(heart$id)), ncol=8)
for(i in 1:length(unique(heart$id)))
 {
  if(length(heart$id[heart$id==i]) == 1)
   heart.one[i,] <- as.numeric(unlist(heart[heart$id==i, ]))
  else if(length(heart$id[heart$id==i]) == 2)
   heart.one[i,] <- as.numeric(unlist(heart[heart$id==i,][2,]))
 }

heart.one[,3][heart.one[,3] == 0] <- 2 	## converting censored events to 2, from 0
if(is.factor(heart$transplant))
 heart.one[,7] <- heart.one[,7] - 1
 ## getting back to correct transplantation coding
heart.one <- as.data.frame(heart.one[order(unlist(heart.one[,2]), unlist(heart.one[,3])),])
names(heart.one) <- names(heart)
# back to usual censoring indicator:
heart.one[,3][heart.one[,3] == 2] <- 0 
# note: transplant says 0 (for no transplants) or 1 (for one transplant)
#        and event = 1 is death, while event = 0 is censored

# plot single Kaplan-Meier curve from heart data, first creating survival object
heart.surv <- survfit(Surv(stop, event) ~ 1, data=heart.one, conf.int = FALSE)

# figure 3: traditional Kaplan-Meier curve
# postscript('ehgfig3.ps', horiz=TRUE)
# omi <- par(omi=c(0,1.25,0.5,1.25))
 plot(heart.surv, ylab='estimated survival probability',
      xlab='observation time (in days)')
 title('Figure 3: Kaplan-Meier curve for Stanford data', cex=0.8)
# dev.off()

## now, draw event history graph for Stanford heart data; use as Figure 4

# postscript('ehgfig4.ps', horiz=TRUE, colors = seq(0, 1, len=20))
# par(omi=c(0,1.25,0.5,1.25))
 event.history(heart.one, 
		survtime.col=heart.one[,2], surv.col=heart.one[,3],
		covtime.cols = cbind(rep(0, dim(heart.one)[1]), heart.one[,1]),
		cov.cols = cbind(rep(0, dim(heart.one)[1]), heart.one[,7]),
		num.colors=2, colors=c(6,10),
		x.lab = 'time under observation (in days)',
		title='Figure 4: Event history graph for\nStanford data',
		cens.mark.right =TRUE, cens.mark = '-', 
		cens.mark.ahead = 30.0, cens.mark.cex = 0.85)
# dev.off()



# now, draw age-stratified event history graph for Stanford heart data; 
#  use as Figure 5

# two plots, stratified by age status
# postscript('c:\temp\ehgfig5.ps', horiz=TRUE, colors = seq(0, 1, len=20))
# par(omi=c(0,1.25,0.5,1.25))
 par(mfrow=c(1,2))

 event.history(data=heart.one, subset.rows = (heart.one[,4] < 0),
		survtime.col=heart.one[,2], surv.col=heart.one[,3],
		covtime.cols = cbind(rep(0, dim(heart.one)[1]), heart.one[,1]),
		cov.cols = cbind(rep(0, dim(heart.one)[1]), heart.one[,7]),
		num.colors=2, colors=c(6,10),  
		x.lab = 'time under observation\n(in days)',
		title = 'Figure 5a:\nStanford data\n(age < 48)',
		cens.mark.right =TRUE, cens.mark = '-', 
		cens.mark.ahead = 40.0, cens.mark.cex = 0.85,
		xlim=c(0,1900))

 event.history(data=heart.one, subset.rows = (heart.one[,4] >= 0),
		survtime.col=heart.one[,2], surv.col=heart.one[,3],
		covtime.cols = cbind(rep(0, dim(heart.one)[1]), heart.one[,1]),
		cov.cols = cbind(rep(0, dim(heart.one)[1]), heart.one[,7]),
		num.colors=2, colors=c(6,10),
		x.lab = 'time under observation\n(in days)',
		title = 'Figure 5b:\nStanford data\n(age >= 48)',
		cens.mark.right =TRUE, cens.mark = '-', 
		cens.mark.ahead = 40.0, cens.mark.cex = 0.85,
		xlim=c(0,1900))
# dev.off()
# par(omi=omi)

# we will not show liver cirrhosis data manipulation, as it was 
#  a bit detailed; however, here is the 
#  event.history code to produce Figure 7 / Plate 1

# Figure 7 / Plate 1 : prothrombin ehg with color
## Not run: 
##D second.arg <- 1				### second.arg is for shading
##D third.arg <- c(rep(1,18),0,1)		### third.arg is for intensity
##D 
##D # postscript('c:\temp\ehgfig7.ps', horiz=TRUE, 
##D # colors = cbind(seq(0, 1, len = 20), second.arg, third.arg)) 
##D # par(omi=c(0,1.25,0.5,1.25), col=19)
##D  event.history(cirrhos2.eh, subset.rows = NULL,
##D                survtime.col=cirrhos2.eh$time, surv.col=cirrhos2.eh$event,
##D 		covtime.cols = as.matrix(cirrhos2.eh[, ((2:18)*2)]),
##D 		cov.cols = as.matrix(cirrhos2.eh[, ((2:18)*2) + 1]),
##D 		cut.cov =  as.numeric(quantile(as.matrix(cirrhos2.eh[, ((2:18)*2) + 1]),
##D 				c(0,.2,.4,.6,.8,1), na.rm=TRUE) + c(-1,0,0,0,0,1)),	
##D  		colors=c(20,4,8,11,14),
##D 		x.lab = 'time under observation (in days)',
##D 		title='Figure 7: Event history graph for liver cirrhosis data (color)',
##D 		cens.mark.right =TRUE, cens.mark = '-', 
##D 		cens.mark.ahead = 100.0, cens.mark.cex = 0.85)
##D # dev.off()
## End(Not run)



