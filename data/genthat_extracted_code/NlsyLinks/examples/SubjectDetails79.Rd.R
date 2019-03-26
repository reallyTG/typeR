library(NlsyLinks)


### Name: SubjectDetails79
### Title: Dataset containing further details of the Gen1 and Gen2
###   subjects.
### Aliases: SubjectDetails79
### Keywords: datasets

### ** Examples

library(NlsyLinks) #Load the package into the current R session.

summary(SubjectDetails79)

oldPar <- par(mfrow=c(3,2), mar=c(2,2,1,.5), tcl=0, mgp=c(1,0,0))
hist(SubjectDetails79$SiblingCountInNls, main="",
     breaks=seq(from=0, to=max(SubjectDetails79$SiblingCountInNls, na.rm=TRUE), by=1)
)
hist(SubjectDetails79$BirthOrderInNls, main="",
     breaks=seq(from=0, to=max(SubjectDetails79$BirthOrderInNls, na.rm=TRUE), by=1)
)
hist(SubjectDetails79$SimilarAgeCount, main="",
     breaks=seq(from=0, to=max(SubjectDetails79$SimilarAgeCount, na.rm=TRUE), by=1)
)
hist(SubjectDetails79$KidCountBio, main="",
     breaks=seq(from=0, to=max(SubjectDetails79$KidCountBio, na.rm=TRUE), by=1)
)
hist(SubjectDetails79$KidCountInNls, main="",
     breaks=seq(from=0, to=max(SubjectDetails79$KidCountInNls, na.rm=TRUE), by=1)
)
#hist(SubjectDetails79$Mob, main="", 
#     breaks=seq.Date(
#       from=min(SubjectDetails79$Mob, na.rm=TRUE), 
#       to=max(SubjectDetails79$Mob, na.rm=TRUE), 
#       by="year")
#)
par(oldPar)




