library(qcc)


### Name: orangejuice2
### Title: Orange juice data - Part 2
### Aliases: orangejuice2
### Keywords: datasets

### ** Examples

data(orangejuice2)
orangejuice2$d <- orangejuice2$D/orangejuice2$size
attach(orangejuice2)
summary(orangejuice2)
boxplot(d ~ trial)
mark <- ifelse(trial, 1, 2)
plot(sample, d, type="b", col=mark, pch=mark)
detach(orangejuice2)



