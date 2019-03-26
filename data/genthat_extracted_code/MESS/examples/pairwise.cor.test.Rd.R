library(MESS)


### Name: pairwise.cor.test
### Title: Pairwise Tests for Association/Correlation Between Paired
###   Samples
### Aliases: pairwise.cor.test

### ** Examples


attach(airquality)
Month <- factor(Month, labels = month.abb[5:9])
pairwise.cor.test(Ozone, Month)
pairwise.cor.test(Ozone, Month, p.adj = "bonf")
detach()



