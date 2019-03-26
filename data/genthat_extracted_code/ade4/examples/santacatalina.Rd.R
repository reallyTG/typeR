library(ade4)


### Name: santacatalina
### Title: Indirect Ordination
### Aliases: santacatalina
### Keywords: datasets

### ** Examples

data(santacatalina)
coa1 <- dudi.coa(log(santacatalina + 1), scan = FALSE) # 2 factors

if(adegraphicsLoaded()) {
  g1 <- table.value(log(santacatalina + 1), plot = FALSE)
  g2 <- table.value(log(santacatalina + 1)[, sample(10)], plot = FALSE)
  g3 <- table.value(log(santacatalina + 1)[order(coa1$li[, 1]), order(coa1$co[, 1])], plot = FALSE)
  g4 <- scatter(coa1, posi = "bottomright", plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
} else {
  par(mfrow = c(2, 2))
  table.value(log(santacatalina + 1))
  table.value(log(santacatalina + 1)[, sample(10)])
  table.value(log(santacatalina + 1)[order(coa1$li[, 1]), order(coa1$co[, 1])]) 
  scatter(coa1, posi = "bottomright")
  par(mfrow = c(1, 1))
}


