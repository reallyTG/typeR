library(ade4)


### Name: discrimin
### Title: Linear Discriminant Analysis (descriptive statistic)
### Aliases: discrimin plot.discrimin print.discrimin
### Keywords: multivariate

### ** Examples

data(chazeb)
dis1 <- discrimin(dudi.pca(chazeb$tab, scan = FALSE), chazeb$cla, 
    scan = FALSE)
dis1
if(!adegraphicsLoaded())
  plot(dis1)

data(skulls)
plot(discrimin(dudi.pca(skulls, scan = FALSE), gl(5,30), 
    scan = FALSE))



