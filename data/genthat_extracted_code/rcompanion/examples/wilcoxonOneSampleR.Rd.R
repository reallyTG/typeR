library(rcompanion)


### Name: wilcoxonOneSampleR
### Title: r effect size for Wilcoxon one-sample signed-rank test
### Aliases: wilcoxonOneSampleR

### ** Examples

data(Pooh)
Data = Pooh[Pooh$Time==2,]
wilcox.test(Data$Likert, mu=3, exact=FALSE)
wilcoxonOneSampleR(x = Data$Likert, mu=3)




