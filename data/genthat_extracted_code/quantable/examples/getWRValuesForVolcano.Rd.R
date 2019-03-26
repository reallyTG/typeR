library(quantable)


### Name: getWRValuesForVolcano
### Title: get p-values of wilcoxon rank sum test for volcano
### Aliases: getWRValuesForVolcano

### ** Examples

a <- t(replicate(200,rnorm(20,runif(1,-3,3),1)))
b <- a[1:100,]
a <- a[101:200,]
boxplot(t(a[1:20,]))
boxplot(t(b[1:20,]))
res <- getWRValuesForVolcano(a,b)
volcanoplot(res$fchange , res$pval)



