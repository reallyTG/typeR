library(PresenceAbsence)


### Name: error.threshold.plot
### Title: Error Threshold Plot
### Aliases: error.threshold.plot
### Keywords: models

### ** Examples


data(SIM3DATA)

error.threshold.plot(SIM3DATA,opt.methods=c(1,2,5))

error.threshold.plot(	SIM3DATA, 
				which.model=2, 
				opt.thresholds=TRUE, 
				opt.methods=c("Default", "Sens=Spec", "MinROCdist"), 					vert.lines=TRUE)


error.threshold.plot(	SIM3DATA,
				threshold=101,
				which.model=2,
				na.rm=TRUE,
				xlab="Threshold",
				ylab="Accuracy Measures",
				main="Error Rate verses Threshold",
				model.names=NULL, 
				pch=NULL,
				color= c(3,5,7),
				line.type=NULL,
				lwd=1,
				plot.it=TRUE,
				opt.thresholds=TRUE,
				opt.methods=1:4,
				req.sens=0.85,
				req.spec=0.85,
				obs.prev=NULL,
				smoothing=1,
				vert.lines=FALSE,
				add.legend=TRUE,
				legend.cex=0.8)





