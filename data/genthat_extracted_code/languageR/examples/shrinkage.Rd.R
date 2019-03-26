library(languageR)


### Name: shrinkage
### Title: Data set illustrating shrinkage
### Aliases: shrinkage
### Keywords: datasets

### ** Examples
## Not run: 
##D data(shrinkage)
##D 
##D require(lme4)
##D require(lmerTest)
##D require(optimx)
##D 
##D shrinkage.lmer = lmer(RT ~ frequency + (1|subject), 
##D   data = shrinkage,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb"))
##D shrinkage.lmList = lmList(RT ~ frequency | subject, data = shrinkage)
##D 
##D # and visualize the difference between random regression 
##D # and mixed-effects regression
##D 
##D mixed = coef(shrinkage.lmer)[[1]]
##D random = coef(shrinkage.lmList)
##D subj = unique(shrinkage[,c("subject", "ranef")])
##D subj = subj[order(subj$subject),]
##D subj$random = random[,1]
##D subj$mixed = mixed[,1]
##D subj = subj[order(subj$random),]
##D subj$rank = 1:nrow(subj)
##D 
##D par(mfrow=c(1,2))
##D plot(subj$rank, subj$random, xlab="rank", ylab="RT", ylim=c(200,550), type="n")
##D text(subj$rank, subj$random, as.character(subj$subject), cex=0.8, col="red")
##D mtext("random regression", 3, 1)
##D points(subj$rank, 400+subj$ranef, col="blue")
##D abline(h=400)
##D plot(subj$rank, subj$mixed, xlab="rank", ylab="RT", ylim=c(200,550), type="n")
##D text(subj$rank, subj$mixed, as.character(subj$subject), cex=0.8, col = "red")
##D mtext("mixed-effects regression", 3, 1)
##D points(subj$rank, 400+subj$ranef, col="blue")
##D abline(h=400)
##D par(mfrow=c(1,1))
## End(Not run)


