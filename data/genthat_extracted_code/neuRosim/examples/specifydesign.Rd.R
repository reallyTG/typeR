library(neuRosim)


### Name: specifydesign
### Title: Generate design matrix.
### Aliases: specifydesign
### Keywords: low-level

### ** Examples

os <- list(c(20,60),c(15,35))
d <- list(20, 10)
total <- 80
TR <- 2
out <- specifydesign(os, d, total, TR, effectsize=list(2,5), conv="double-gamma")
## Don't show: 
rm(os,d,total,TR,out)
## End(Don't show)



