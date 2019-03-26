library(ade4)


### Name: scatter.coa
### Title: Plot of the factorial maps for a correspondence analysis
### Aliases: scatter.coa
### Keywords: multivariate hplot

### ** Examples

data(housetasks)
w <- dudi.coa(housetasks, scan = FALSE)
if(adegraphicsLoaded()) {
  g1 <- scatter(w, method = 1, psub.text = "1 / Standard", posieig = "none", plot = FALSE)
  g2 <- scatter(w, method = 2, psub.text = "2 / Columns -> averaging -> Rows", 
    posieig = "none", plot = FALSE)
  g3 <- scatter(w, method = 3, psub.text = "3 / Rows -> averaging -> Columns ", 
    posieig = "none", plot = FALSE)
  G <- ADEgS(list(g1, g2, g3), layout = c(2, 2))
  
} else {
  par(mfrow = c(2, 2))
  scatter(w, method = 1, sub = "1 / Standard", posieig = "none")
  scatter(w, method = 2, sub = "2 / Columns -> averaging -> Rows", posieig = "none")
  scatter(w, method = 3, sub = "3 / Rows -> averaging -> Columns ", posieig = "none")
  par(mfrow = c(1, 1))
}


