library(PresenceAbsence)


### Name: auc.roc.plot
### Title: AUC ROC Plot
### Aliases: auc.roc.plot
### Keywords: models

### ** Examples


data(SIM3DATA)

auc.roc.plot(SIM3DATA)

auc.roc.plot(	SIM3DATA,
			opt.thresholds=TRUE,
			opt.methods=c("Default","Sens=Spec","MinROCdist"))

auc.roc.plot(	SIM3DATA,
			threshold=101,
			which.model=c(2,3),
			model.names=c("model a","model b","model c"),
			na.rm=TRUE,
			xlab="1-Specificity (false positives)",
			ylab="Sensitivity (true positives)",
			main="ROC Plot", 
			color=TRUE,
			line.type=TRUE,
			lwd=1,
			mark=0,
			mark.numbers=TRUE,
			opt.thresholds=TRUE,
			opt.methods=c(1,2,4),
			req.sens=0.85,
			req.spec=0.85,
			obs.prev=NULL,
			add.legend=TRUE,
			legend.text=NULL,
			legend.cex=0.8,
			add.opt.legend=TRUE,
			opt.legend.text=NULL,
			opt.legend.cex=0.7,
			counter.diagonal=TRUE,
			pch=NULL)



