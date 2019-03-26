library(amap)


### Name: burt
### Title: Compute burt table from a factor dataframe.
### Aliases: burt matlogic
### Keywords: multivariate

### ** Examples

color <- as.factor(c('blue','red','red','blue','red'))
size <- as.factor(c('large','large','small','medium','large'))
x <- data.frame(color,size)

matlogic(x)
##  color.blue color.red size.large size.medium size.small
##1          1         0          1           0          0
##2          0         1          1           0          0
##3          0         1          0           0          1
##4          1         0          0           1          0
##5          0         1          1           0          0

burt(x)
##              color.blue color.red size.large size.medium size.small
##  color.blue           2         0          1           1          0
##  color.red            0         3          2           0          1
##  size.large           1         2          3           0          0
##  size.medium          1         0          0           1          0
##  size.small           0         1          0           0          1



