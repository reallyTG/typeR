library(agridat)


### Name: stephens.sorghum.uniformity
### Title: Uniformity trial of sorghum silage
### Aliases: stephens.sorghum.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(stephens.sorghum.uniformity)
##D   dat <- stephens.sorghum.uniformity
##D 
##D   dat <- subset(dat, row>2 & row<99) # omit outer two rows
##D   # mean(dat$yield) # 180.27
##D   # range(dat$yield) # 75,302 matches Stephens
##D   
##D   # densityplot(~dat$yield) # Stephens figure 3
##D   
##D   # Aggregate 4 side-by-side rows.
##D   d4 <- dat
##D   d4$row2 <- ceiling((d4$row-2)/4)
##D   d4 <- aggregate(yield ~ row2+col, data=d4, FUN=sum)
##D   d4$row2 <- 25-d4$row2 # flip horizontally
##D   
##D   require(desplot)
##D   grays <- colorRampPalette(c("#d9d9d9","#252525"))
##D   desplot(yield ~ row2*col, data=d4,
##D           aspect=333/330, flip=TRUE, # true aspect
##D           main="stephens.sorghum.uniformity",
##D           col.regions=grays(3),
##D           at=c(500,680,780,1000))
##D   # Similar to Stephens Figure 7.  North at top.  East at right.
##D   
## End(Not run)



