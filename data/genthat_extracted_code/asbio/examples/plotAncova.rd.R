library(asbio)


### Name: plotAncova
### Title: Creates plots for one way ANCOVAs
### Aliases: plotAncova
### Keywords: graphs

### ** Examples


x <- rnorm(20)
y <- 3 * x + rnorm(20)
cat <- c(rep("A",5),rep("B",5),rep("C",5),rep("D",5))
l <- lm(y ~ x * cat)
plotAncova(l, leg.loc = "bottomright")



