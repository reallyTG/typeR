library(agridat)


### Name: lord.rice.uniformity
### Title: Uniformity trial of rice
### Aliases: lord.rice.uniformity
### Keywords: datasets

### ** Examples

data(lord.rice.uniformity)
dat <- lord.rice.uniformity

# match table on page 180
## require(dplyr)
## dat %>% group_by(field) %>% dplyr::summarize(grain=sum(grain), straw=sum(straw))
##   field grain straw
##   <chr> <dbl> <dbl>
## 1 10      590   732
## 2 11      502   600
## 3 12      315   488
## 4 13      291   538
## 5 14      489   670
## 6 26      441   560
## 7 27      451   629
## 8 28      530   718

# There are consistently high yields along all edges of the field
# require(lattice)
# bwplot(grain ~ factor(col)|field,dat)
# bwplot(grain ~ factor(col)|field,dat)

# Heatmaps
if(require(desplot)){
  desplot(grain ~ col*row|field, dat,
          flip=TRUE, aspect=140/50,
          main="lord.rice.uniformity")
}

# bivariate scatterplots  
# xyplot(grain ~ straw|field, dat)




