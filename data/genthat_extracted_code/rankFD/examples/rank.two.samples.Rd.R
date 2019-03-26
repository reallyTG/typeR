library(rankFD)


### Name: rank.two.samples
### Title: A function for analyzing two-sample problems
### Aliases: rank.two.samples

### ** Examples

data(Muco)
Muco2 <- subset(Muco, Disease != "OAD")
twosample <- rank.two.samples(HalfTime ~ Disease, data = Muco2, 
   alternative = "greater", method = "probit", wilcoxon = "exact", plot.simci = FALSE)




