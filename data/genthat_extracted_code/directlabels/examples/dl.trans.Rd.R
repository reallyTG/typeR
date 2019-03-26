library(directlabels)


### Name: dl.trans
### Title: Direct label data transform
### Aliases: dl.trans

### ** Examples

complicated <- list(dl.trans(x=x+10),
                    gapply.fun(d[-2,]),
                    rot=c(30,180))
library(lattice)
direct.label(dotplot(VADeaths,type="o"),complicated,TRUE)



