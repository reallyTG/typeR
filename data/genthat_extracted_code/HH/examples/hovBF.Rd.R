library(HH)


### Name: hovBF
### Title: Homogeneity of Variance: Brown-Forsyth method
### Aliases: hovBF hovplotBF
### Keywords: dplot

### ** Examples

data(batch)
batch1.aov <- aov(Calcium ~ Batch, data=batch)
anova(batch1.aov)
hovBF(Calcium ~ Batch, data=batch)
hovplotBF(Calcium ~ Batch, data=batch)



