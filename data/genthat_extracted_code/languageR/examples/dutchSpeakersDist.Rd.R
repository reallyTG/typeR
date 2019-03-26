library(languageR)


### Name: dutchSpeakersDist
### Title: Cross-entropy based distances between speakers
### Aliases: dutchSpeakersDist
### Keywords: datasets

### ** Examples

	## Not run: 
##D     data(dutchSpeakersDist)
##D     dutchSpeakersDist.d = as.dist(dutchSpeakersDist)
##D     dutchSpeakersDist.mds = cmdscale(dutchSpeakersDist.d, k = 3)
##D 
##D     data(dutchSpeakersDistMeta)
##D     dat = data.frame(dutchSpeakersDist.mds, 
##D        Sex = dutchSpeakersDistMeta$Sex, 
##D        Year = dutchSpeakersDistMeta$AgeYear, 
##D        EduLevel = dutchSpeakersDistMeta$EduLevel)
##D     dat = dat[!is.na(dat$Year),]
##D 
##D     par(mfrow=c(1,2))
##D     plot(dat$Year, dat$X1, xlab="year of birth", 
##D        ylab = "dimension 1", type = "p")
##D     lines(lowess(dat$Year, dat$X1))
##D     boxplot(dat$X3 ~ dat$Sex, ylab = "dimension 3")
##D     par(mfrow=c(1,1))
##D 
##D     cor.test(dat$X1, dat$Year, method="sp")
##D     t.test(dat$X3~dat$Sex)
##D 	
## End(Not run)



