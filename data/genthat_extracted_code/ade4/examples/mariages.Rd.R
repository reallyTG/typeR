library(ade4)


### Name: mariages
### Title: Correspondence Analysis Table
### Aliases: mariages
### Keywords: datasets

### ** Examples

data(mariages)
w <- dudi.coa(mariages, scan = FALSE, nf = 3)

if(adegraphicsLoaded()) {
  g1 <- scatter(w, met = 1, posi = "bottomleft", plot = FALSE)
  g2 <- scatter(w, met = 2, posi = "bottomleft", plot = FALSE)
  g3 <- scatter(w, met = 3, posi = "bottomleft", plot = FALSE)
  ## g4 <- score(w, 3)
  G <- ADEgS(list(g1, g2, g3), layout = c(2, 2))

} else {
  par(mfrow = c(2, 2))
  scatter(w, met = 1, posi = "bottom")
  scatter(w, met = 2, posi = "bottom")
  scatter(w, met = 3, posi = "bottom")
  score(w, 3)
  par(mfrow = c(1, 1))
}


