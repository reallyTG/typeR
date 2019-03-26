library(FSA)


### Name: dunnTest
### Title: Dunn's Kruskal-Wallis Multiple Comparisons.
### Aliases: dunnTest dunnTest.default dunnTest.formula print.dunnTest

### ** Examples

## pH in four ponds data from Zar (2010)
ponds <- data.frame(pond=as.factor(rep(1:4,each=8)),
                    pH=c(7.68,7.69,7.70,7.70,7.72,7.73,7.73,7.76,
                         7.71,7.73,7.74,7.74,7.78,7.78,7.80,7.81,
                         7.74,7.75,7.77,7.78,7.80,7.81,7.84,NA,
                         7.71,7.71,7.74,7.79,7.81,7.85,7.87,7.91))
ponds2 <- ponds[complete.cases(ponds),]

# non-formula usage (default "holm" method)
dunnTest(ponds2$pH,ponds2$pond)

# formula usage (default "holm" method)
dunnTest(pH~pond,data=ponds2)

# other methods
dunnTest(pH~pond,data=ponds2,method="bonferroni")
dunnTest(pH~pond,data=ponds2,method="bh")
dunnTest(pH~pond,data=ponds2,method="none")

# one-sided
dunnTest(pH~pond,data=ponds2,two.sided=FALSE)

# warning message if incomplete cases were removed
dunnTest(pH~pond,data=ponds)

# print dunn.test results
tmp <- dunnTest(pH~pond,data=ponds2)
print(tmp,dunn.test.results=TRUE)




