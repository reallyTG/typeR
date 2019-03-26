library(gamair)


### Name: sitka
### Title: Sitka spruce growth data.
### Aliases: sitka
### Keywords: data

### ** Examples

  require(gamair); require(lattice)
  data(sitka)
  xyplot(log.size~days|as.factor(ozone),data=sitka,type="l",groups=id.num)




