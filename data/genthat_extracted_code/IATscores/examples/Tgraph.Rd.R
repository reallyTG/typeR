library(IATscores)


### Name: Tgraph
### Title: Layout 'qgraph' for multiple comparisons by package 'nparcomp'
### Aliases: Tgraph
### Keywords: multiple comparisons Tgraph

### ** Examples

library(nparcomp)
library(qgraph)

dat <- data.frame(matrix(nrow = 300, ncol = 0))

dat$DV <- c(rnorm(100, 1, 1),
       rnorm(100, 0, 1),
       rnorm(100, 0, 1))

dat$IV <- c(rep("A", 100),
        rep("B", 100),
        rep("D", 100))

mcmp <- mctp(formula = DV~IV, data = dat, type = "Tukey")
tg <- Tgraph(mcmp)
qgraph(tg$amat, layout = tg$layout)

tg2 <- Tgraph(mcmp,  horizorder = c("A", "D", "B"))
qgraph(tg2$amat, layout = tg2$layout)



