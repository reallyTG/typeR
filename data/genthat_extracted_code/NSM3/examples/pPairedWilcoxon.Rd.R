library(NSM3)


### Name: pPairedWilcoxon
### Title: Paired Wilcoxon
### Aliases: pPairedWilcoxon
### Keywords: Wilcoxon Paired

### ** Examples

##Hollander-Wolfe-Chicken Example 3.1 Hamilton Depression Scale Factor IV
x <-c(1.83, .50, 1.62, 2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
y <-c(0.878, .647, .598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)

wilcox.test(y,x,paired=TRUE,alternative="less")
pPairedWilcoxon(x,y)



