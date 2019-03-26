library(adegraphics)


### Name: ADEgS
### Title: Creation of 'ADEgS' objects
### Aliases: ADEgS
### Keywords: hplot

### ** Examples

xy <- matrix(rnorm(20), ncol = 2)
g1 <- s.label(xy)
g2 <- s.class(xy, fac = as.factor(rep(LETTERS[1:2], length.out = 10)), ppoints.cex = 0,
  col = c("blue", "red"))
g3 <- ADEgS(list(g1, g2), rbind(c(0, 0, 0.5, 1), c(0.5, 0, 1, 1)))
g4 <- ADEgS(list(g1, g2), layout = c(2, 1))
g5 <- ADEgS(list(g1, g2))
g6 <- ADEgS(list(g1, g2), add = matrix(c(0, 1, 0, 0), byrow = TRUE, ncol = 2))

data(olympic, package = "ade4")
dudi1 <- ade4::dudi.pca(olympic$tab, scan = FALSE)
g7 <- s.arrow(dudi1$li)
g8 <- s.corcircle(dudi1$co, lab = names(olympic$tab))
g9 <- ADEgS(list(g7, g8), rbind(c(0, 0, 0.5, 1), c(0.5, 0, 1, 1)))
g9[[1]]
g9[1, drop = FALSE]
length(g9)



