library(npsm)


### Name: kancova
### Title: Robust Analysis of Covariance under Heterogeneous Slopes for a
###   k-way layout
### Aliases: kancova

### ** Examples

 levels <- c(2,2)
 y.group <- huitema496[,c('y','i','j')]
 xcov <- huitema496[,'x']
 kancova(levels,y.group,xcov)




