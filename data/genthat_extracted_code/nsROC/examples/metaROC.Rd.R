library(nsROC)


### Name: metaROC
### Title: Non-parametric ROC curve estimate for meta-analysis
### Aliases: metaROC metaROC.default
### Keywords: meta-analysis

### ** Examples

data(interleukin6)

# Fixed-effects meta-analysis showing linear interpolations of the papers considered in the graphic
output1 <- metaROC(interleukin6, plot.Author=TRUE)

# Random-effects meta-analysis displaying also a window with a plot of the inter-study
# variability estimate
output2 <- metaROC(interleukin6, model="random-effects", plot.Author=TRUE)



