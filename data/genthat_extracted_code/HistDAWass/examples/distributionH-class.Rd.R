library(HistDAWass)


### Name: distributionH-class
### Title: Class distributionH.
### Aliases: distributionH-class distributionH
###   initialize,distributionH-method distributionH
### Keywords: classes

### ** Examples

 #---- initialize a distributionH object mydist
# from a simple histogram 
# ----------------------------
# | Bins    |  Prob  | cdf   |
# ----------------------------
# | [1,2)   |  0.4   | 0.4   |
# | [2,3]   |  0.6   | 1.0   |
# ----------------------------
# | Tot.    |  1.0   | -     |
# ----------------------------
mydist=new("distributionH",c(1,2,3),c(0, 0.4, 1))
str(mydist)
# OUTPUT
# Formal class 'distributionH' [package "HistDAWass"] with 4 slots
#   ..@ x: num [1:3] 1 2 3 the quantiles
#   ..@ p: num [1:3] 0 0.4 1 the cdf
#   ..@ m: num 2.1 the mean
#   ..@ s: num 0.569 the standard deviation
# or using
mydist=distributionH(x=c(1,2,3),p=c(0,0.4, 1))



