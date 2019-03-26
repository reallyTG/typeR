library(tgram)


### Name: tgram
### Title: Compute Tracheidograms
### Aliases: tgram plot.tgram
### Keywords: smooth manip

### ** Examples


data(traq.profile)

plot(tgram(traq.profile, mw=10),leyenda=c("lumen","double wall"),
        xlab="distance pixel", ylab="grey value",ylim=c(0,250),
        bg.legend="white")






