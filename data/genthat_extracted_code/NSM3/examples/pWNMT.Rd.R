library(NSM3)


### Name: pWNMT
### Title: Wilcoxon, Nemenyi, McDonald-Thompson
### Aliases: pWNMT
### Keywords: Wilcoxon Nemenyi McDonald-Thompson

### ** Examples

##Hollander-Wolfe-Chicken Example 7.3 Rounding First Base
RoundingTimes<-matrix(c(5.40, 5.50, 5.55, 5.85, 5.70, 5.75, 5.20, 5.60, 5.50, 5.55, 5.50, 5.40,
5.90, 5.85, 5.70, 5.45, 5.55, 5.60, 5.40, 5.40, 5.35, 5.45, 5.50, 5.35, 5.25, 5.15, 5.00, 5.85,
5.80, 5.70, 5.25, 5.20, 5.10, 5.65, 5.55, 5.45, 5.60, 5.35, 5.45, 5.05, 5.00, 4.95, 5.50, 5.50,
5.40, 5.45, 5.55, 5.50, 5.55, 5.55, 5.35, 5.45, 5.50, 5.55, 5.50, 5.45, 5.25, 5.65, 5.60, 5.40,
5.70, 5.65, 5.55, 6.30, 6.30, 6.25),nrow = 22,byrow = TRUE,dimnames = list(1 : 22,
c("Round Out", "Narrow Angle", "Wide Angle")))

pWNMT(RoundingTimes,n.mc=2500)



