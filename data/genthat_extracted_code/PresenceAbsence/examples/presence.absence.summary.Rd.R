library(PresenceAbsence)


### Name: presence.absence.summary
### Title: Presence/Absence Summary Plots
### Aliases: presence.absence.summary
### Keywords: models

### ** Examples

data(SIM3DATA)

presence.absence.summary(SIM3DATA)

presence.absence.summary(	SIM3DATA,
					threshold=101,
					find.auc=TRUE,
					which.model=2,
					na.rm=FALSE,
					main=NULL,
					model.names=NULL,
					alpha=0.05,
					N.bins=5,
					N.bars=10,
					truncate.tallest=FALSE,
					opt.thresholds=TRUE,
					opt.methods=c(1,2,4),
					req.sens=0.85,
					req.spec=0.85,
					obs.prev=NULL,
					smoothing=1,
					vert.lines=FALSE,
					add.legend=TRUE,
					add.opt.legend=TRUE,
					legend.cex=0.6,
					opt.legend.cex=0.6,
					pch=NULL)



