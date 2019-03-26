library(ade4)


### Name: zealand
### Title: Road distances in New-Zealand
### Aliases: zealand
### Keywords: datasets

### ** Examples

data(zealand)
d0 <- as.dist(as.matrix(zealand$road))
d1 <- cailliez (d0)
d2 <- lingoes(d0)

if(adegraphicsLoaded()) {
  G1 <- s.label(zealand$xy, lab = as.character(1:13), nb = zealand$nb)
  
  g1 <- s.label(cmdscale(dist(zealand$xy)), lab = as.character(1:13), nb = zealand$nb, 
    psub.text = "Distance canonique", plot = FALSE)
  g2 <- s.label(cmdscale(d0), lab = as.character(1:13), nb = zealand$nb, 
    psub.text = "Distance routiere", plot = FALSE)
  g3 <- s.label(cmdscale(d1), lab = as.character(1:13), nb = zealand$nb, 
    psub.text = "Distance routiere / Cailliez", plot = FALSE)
  g4 <- s.label(cmdscale(d2), lab = as.character(1:13), nb = zealand$nb, 
    psub.text = "Distance routiere / Lingoes", plot = FALSE)
  G2 <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))

} else {
  s.label(zealand$xy, lab = as.character(1:13), neig = zealand$neig)
  par(mfrow = c(2, 2))
  s.label(cmdscale(dist(zealand$xy)), lab = as.character(1:13), 
    neig = zealand$neig, sub = "Distance canonique", csub = 2)
  s.label(cmdscale(d0), lab = as.character(1:13), neig = zealand$neig, 
    sub = "Distance routiere", csub = 2)
  s.label(cmdscale(d1), lab = as.character(1:13), neig = zealand$neig, 
    sub = "Distance routiere / Cailliez", csub = 2)
  s.label(cmdscale(d2), lab = as.character(1:13), neig = zealand$neig, 
    sub = "Distance routiere / Lingoes", csub = 2)
}


