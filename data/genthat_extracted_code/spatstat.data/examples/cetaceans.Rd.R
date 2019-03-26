library(spatstat.data)


### Name: cetaceans
### Title: Point patterns of whale and dolphin sightings.
### Aliases: cetaceans cetaceans.extra
### Keywords: datasets

### ** Examples

  if(require(spatstat)) {
     cet <- cetaceans
     cet$dMplank <- with(cet, distfun(plankton, undef=20))
     cet$dMfish <- with(cet, distfun(fish, undef=20))
     fit.whales <- mppm(whales ~ dMplank + dMfish,data=cet)
     anova(fit.whales,test="Chi")
     # Note that inference is *conditional* on the fish and
     # plankton patterns.
     cetPats <- cetaceans.extra$patterns
     plot(Window(cetPats[[1]]),main="The window")
     plot(cetPats,nrows=3,main="All data")
  }



