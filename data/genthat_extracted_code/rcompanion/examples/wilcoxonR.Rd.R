library(rcompanion)


### Name: wilcoxonR
### Title: r effect size for Wilcoxon two-sample rank-sum test
### Aliases: wilcoxonR

### ** Examples

data(Breakfast)
Table = Breakfast[1:2,]
library(coin)
chisq_test(Table, scores = list("Breakfast" = c(-2, -1, 0, 1, 2)))
wilcoxonR(Table)

data(PoohPiglet)
Data = PoohPiglet[PoohPiglet$Speaker %in% c("Pooh", "Piglet"),]
wilcox.test(Likert ~ Speaker, data = Data)
wilcoxonR(x = Data$Likert, g = Data$Speaker)




