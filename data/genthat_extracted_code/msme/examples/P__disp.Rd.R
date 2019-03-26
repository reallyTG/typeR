library(msme)


### Name: P__disp
### Title: A function to calculate Pearson Chi2 and its dispersion
###   statistic following glm and glm.nb.
### Aliases: P__disp

### ** Examples

data(medpar)
mymod <- glm(los ~ hmo + white + factor(type), 
             family = poisson, 
             data = medpar)
P__disp(mymod)



