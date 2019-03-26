library(qcr)


### Name: orangejuice
### Title: Orange juice data
### Aliases: orangejuice
### Keywords: datasets

### ** Examples


data(orangejuice)
orangejuice$d <- orangejuice$D/orangejuice$size
attach(orangejuice)
summary(orangejuice)
boxplot(d ~ trial)
mark <- ifelse(trial, 1, 2)
plot(sample, d, type="b", col=mark, pch=mark)



