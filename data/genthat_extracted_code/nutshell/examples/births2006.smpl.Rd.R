library(nutshell)


### Name: births2006.smpl
### Title: Births in the United States, 2006
### Aliases: births2006.smpl births2006.idx
### Keywords: datasets

### ** Examples

data(births2006.smpl)
library(lattice)
histogram(~DBWT|DPLURAL,data=births2006.smpl)
densityplot(~DBWT,groups=DPLURAL,data=births2006.smpl,
  plot.points=FALSE,auto.key=TRUE)



