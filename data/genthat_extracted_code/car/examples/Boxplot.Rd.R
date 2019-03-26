library(car)


### Name: Boxplot
### Title: Boxplots With Point Identification
### Aliases: Boxplot Boxplot.default Boxplot.formula Boxplot.list
###   Boxplot.data.frame Boxplot.matrix
### Keywords: hplot

### ** Examples

Boxplot(~income, data=Prestige, id=list(n=Inf)) # identify all outliers
Boxplot(income ~ type, data=Prestige)
Boxplot(income ~ type, data=Prestige, at=c(1, 3, 2))
Boxplot(k5 + k618 ~ lfp*wc, data=Mroz)
with(Prestige, Boxplot(income, id=list(labels=rownames(Prestige))))
with(Prestige, Boxplot(income, type, id=list(labels=rownames(Prestige))))
Boxplot(scale(Prestige[, 1:4]))



