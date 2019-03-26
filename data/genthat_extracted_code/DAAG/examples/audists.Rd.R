library(DAAG)


### Name: audists
### Title: Road distances between 10 Australian cities
### Aliases: audists
### Keywords: datasets

### ** Examples

data(audists)
audists.cmd <- cmdscale(audists)
xyplot(audists.cmd[,2] ~ audists.cmd[,1], groups=row.names(audists.cmd),
       panel = function(x, y, subscripts, groups)  
                        ltext(x = x, y = y, label = groups[subscripts],
                        cex=1, fontfamily = "HersheySans"))



