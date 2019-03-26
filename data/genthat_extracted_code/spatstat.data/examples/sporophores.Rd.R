library(spatstat.data)


### Name: sporophores
### Title: Sporophores Data
### Aliases: sporophores
### Keywords: datasets

### ** Examples

  if(require(spatstat)) {
## reproduce Fig 1 in Ford et al (1980)
plot(sporophores, chars=c(16,1,2), cex=0.6, leg.args=list(cex=1.1))
points(0,0,pch=16, cex=2)
text(15,8,"Tree", cex=0.75)
  }



