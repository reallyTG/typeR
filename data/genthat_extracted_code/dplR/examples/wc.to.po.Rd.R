library(dplR)


### Name: wc.to.po
### Title: Convert Wood Completeness to Pith Offset
### Aliases: wc.to.po
### Keywords: manip

### ** Examples
library(utils)
data(gp.po)
all(wc.to.po(po.to.wc(gp.po)) == gp.po)



