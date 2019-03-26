library(nutshell)


### Name: yosemite
### Title: Yosemite Valley Elevation Data
### Aliases: yosemite
### Keywords: datasets

### ** Examples

data(yosemite)
yosemite.flipped <- yosemite[,seq(from=253,to=1)]
yosemite.rightmost <- yosemite[nrow(yosemite) - ncol(yosemite) + 1,]
halfdome <- yosemite[(nrow(yosemite) - ncol(yosemite) + 1):562,
                     seq(from=253,to=1)]
persp(halfdome, col=grey(.25), border=NA, expand=.15,
      theta=225, phi=20, ltheta=45, lphi=20, shade=.75)



