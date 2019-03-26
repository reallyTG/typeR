library(agridat)


### Name: talbot.potato
### Title: Multi-environment trial of potato in UK, yields and trait scores
###   at 12 locations
### Aliases: talbot.potato talbot.potato.traits talbot.potato.yield

### ** Examples


if(require(pls) & require(reshape2)){

  data(talbot.potato.traits)
  datt <- talbot.potato.traits
  data(talbot.potato.yield)
  daty <- talbot.potato.yield

  datt <- acast(datt, gen ~ trait, value.var='score')
  daty <- acast(daty, gen ~ loc, value.var='yield')  
  
  # Transform columns to zero mean and unit variance
  datt <- scale(datt)
  daty <- scale(daty)

  m1 <- plsr(daty ~ datt, ncomp=3)
  summary(m1)

  # Loadings factor 1
  lo <- loadings(m1)[,1,drop=FALSE]
  round(-1*lo[order(-1*lo),1,drop=FALSE],2)

  biplot(m1, main="talbot.potato - biplot")

}




