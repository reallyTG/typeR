library(vtreat)


### Name: makekWayCrossValidationGroupedByColumn
### Title: Build a k-fold cross validation splitter, respecting (never
###   splitting) groupingColumn.
### Aliases: makekWayCrossValidationGroupedByColumn

### ** Examples


d <- data.frame(y=sin(1:100))
d$group <- floor(seq_len(nrow(d))/5)
splitter <- makekWayCrossValidationGroupedByColumn('group')
split <- splitter(nrow(d),5,d,d$y)
d$splitLabel <- vtreat::getSplitPlanAppLabels(nrow(d),split)
rowSums(table(d$group,d$splitLabel)>0)




