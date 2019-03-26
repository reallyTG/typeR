library(tables)


### Name: labels
### Title: Retrieve or modify the row or column labels.
### Aliases: rowLabels rowLabels<- colLabels colLabels<- [.tabularColLabels
###   [.tabularRowLabels

### ** Examples

tab <- tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )
colLabels(tab)
colLabels(tab) <- colLabels(tab)[1,]
tab



