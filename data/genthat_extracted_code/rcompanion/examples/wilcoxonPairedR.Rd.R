library(rcompanion)


### Name: wilcoxonPairedR
### Title: r effect size for Wilcoxon two-sample paired signed-rank test
### Aliases: wilcoxonPairedR

### ** Examples

data(Pooh)
wilcox.test(Likert ~ Time, data=Pooh, paired=TRUE, exact=FALSE)
wilcoxonPairedR(x = Pooh$Likert, g = Pooh$Time)




