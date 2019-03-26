library(NSM3)


### Name: cNWWM
### Title: Computes a critical value for the Nemenyi, Wilcoxon-Wilcox,
###   Miller R* distribution.
### Aliases: cNWWM
### Keywords: Nemenyi Wilcoxon-Wilcox Miller

### ** Examples

##Hollander-Wolfe-Chicken Example 7.4 Stuttering Adaptation
#cNWWM(.0492, 3, 18, "Monte Carlo") 
cNWWM(.0492, 3, 18, method="Monte Carlo",n.mc=2500) 
##Comment 7.35
cNWWM(.0093, 3, 3, "Exact")
#cNWWM(.0093, 3, 3, "Monte Carlo")



