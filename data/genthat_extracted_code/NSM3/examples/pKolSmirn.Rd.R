library(NSM3)


### Name: pKolSmirn
### Title: Function to copute the P-value for the observed
###   Kolmogorov-Smirnov J statistic.
### Aliases: pKolSmirn
### Keywords: Kolmogov-Smirnov

### ** Examples

##Hollander-Wolfe-Chicken Example 5.4 Effect of Feedback on Salivation Rate:
feedback<-c(-0.15, 8.6, 5, 3.71, 4.29, 7.74, 2.48, 3.25, -1.15, 8.38)
no.feedback<-c(2.55, 12.07, 0.46, 0.35, 2.69, -0.94, 1.73, 0.73, -0.35, -0.37)
pKolSmirn(x=feedback,y=no.feedback)



