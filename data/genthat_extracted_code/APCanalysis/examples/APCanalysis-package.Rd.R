library(APCanalysis)


### Name: APCanalysis-package
### Title: Analysis of Unreplicated Orthogonal Experiments using All
###   Possible Comparisons
### Aliases: APCanalysis-package APCanalysis
### Keywords: package design

### ** Examples

## This example demonstrates the analysis of an artificial data set for a  12-run 
## Plackett-Burman design stored in "PB12matrix". The values of "PB12response" were 
## generated using the following active effects: B=7, D=5, H=11, I=4 and K=6. The 
## remaining columns were all set to be inactive (effects equal 0). 
my.apc = apc(PB12response, PB12matrix, maxsize=6, method = 2, level = 0.20, reps = 10000)
summary(my.apc)
plot(my.apc)



