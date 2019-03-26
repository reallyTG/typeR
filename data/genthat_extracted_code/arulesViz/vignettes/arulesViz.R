### R code from vignette source 'arulesViz.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: arulesViz.Rnw:75-76
###################################################
options(width = 75)


###################################################
### code chunk number 2: arulesViz.Rnw:236-238
###################################################
options(digits = 2)
set.seed(1234)


###################################################
### code chunk number 3: arulesViz.Rnw:248-250
###################################################
library("arulesViz")
data("Groceries")


###################################################
### code chunk number 4: arulesViz.Rnw:260-261
###################################################
summary(Groceries)


###################################################
### code chunk number 5: arulesViz.Rnw:267-269
###################################################
rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.5))
rules


###################################################
### code chunk number 6: arulesViz.Rnw:277-278
###################################################
inspect(head(rules, n = 3, by ="lift"))


###################################################
### code chunk number 7: arulesViz.Rnw:288-289
###################################################
args(getS3method("plot", "rules"))


###################################################
### code chunk number 8: scatterplot1
###################################################
plot(rules)


###################################################
### code chunk number 9: arulesViz.Rnw:347-348
###################################################
head(quality(rules))


###################################################
### code chunk number 10: scatterplot2
###################################################
plot(rules, measure = c("support", "lift"), shading = "confidence")


###################################################
### code chunk number 11: scatterplot3
###################################################
plot(rules, method = "two-key plot")


###################################################
### code chunk number 12: arulesViz.Rnw:402-404 (eval = FALSE)
###################################################
## sel <- plot(rules, measure=c("support", "lift"), shading = "confidence",
##             interactive = TRUE)


###################################################
### code chunk number 13: arulesViz.Rnw:481-483
###################################################
subrules <- rules[quality(rules)$confidence > 0.8]
subrules


###################################################
### code chunk number 14: matrix1
###################################################
plot(subrules, method = "matrix", measure = "lift")


###################################################
### code chunk number 15: matrix3D1
###################################################
plot(subrules, method = "matrix3D", measure = "lift")


###################################################
### code chunk number 16: clusterplot1
###################################################
plot(rules, method = "grouped")


###################################################
### code chunk number 17: clusterplot2
###################################################
plot(rules, method = "grouped", control = list(k = 50))


###################################################
### code chunk number 18: arulesViz.Rnw:747-748 (eval = FALSE)
###################################################
## sel <- plot(rules, method = "grouped", interactive = TRUE)


###################################################
### code chunk number 19: arulesViz.Rnw:771-772
###################################################
subrules2 <- head(rules, n = 10, by = "lift")


###################################################
### code chunk number 20: graph1
###################################################
plot(subrules2, method = "graph")


###################################################
### code chunk number 21: arulesViz.Rnw:816-817 (eval = FALSE)
###################################################
## saveAsGraph(head(rules, n = 1000, by = "lift"), file = "rules.graphml")


###################################################
### code chunk number 22: pc1
###################################################
plot(subrules2, method = "paracoord")


###################################################
### code chunk number 23: pc2
###################################################
plot(subrules2, method = "paracoord", control = list(reorder = TRUE))


###################################################
### code chunk number 24: arulesViz.Rnw:916-918
###################################################
oneRule <- sample(rules, 1)
inspect(oneRule)


###################################################
### code chunk number 25: doubledecker1
###################################################
plot(oneRule, method = "doubledecker", data = Groceries)


