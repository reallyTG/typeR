library(ade4)


### Name: coleo
### Title: Table of Fuzzy Biological Traits
### Aliases: coleo
### Keywords: datasets

### ** Examples

data(coleo)
op <- par(no.readonly = TRUE) 
coleo.fuzzy <- prep.fuzzy.var(coleo$tab, coleo$col.blocks)
fca1 <- dudi.fca(coleo.fuzzy, sca = FALSE, nf = 3)
indica <- factor(rep(names(coleo$col), coleo$col))

if(adegraphicsLoaded()) {
  glist <- list()
  for(i in levels(indica)) {
    df <- coleo$tab[, which(indica == i)]
    names(df) <- coleo$moda.names[which(indica == i)]
    glist[i] <- s.distri(fca1$l1, df, psub.text = as.character(i), ellipseSize = 0, 
      starSize = 0.5, plot = FALSE, storeData = TRUE)
  }
  G <- ADEgS(glist, layout = c(3, 3))
  
} else {
  par(mfrow = c(3, 3))
  for(j in levels(indica)) 
    s.distri(fca1$l1, coleo$tab[, which(indica == j)], clab = 1.5, sub = as.character(j), 
      cell = 0, csta = 0.5, csub = 3, label = coleo$moda.names[which(indica == j)])
  par(op)
  par(mfrow = c(1, 1))
}


