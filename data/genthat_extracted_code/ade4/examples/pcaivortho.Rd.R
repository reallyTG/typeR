library(ade4)


### Name: pcaivortho
### Title: Principal Component Analysis with respect to orthogonal
###   instrumental variables
### Aliases: pcaivortho summary.pcaivortho
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(avimedi)
##D cla <- avimedi$plan$reg:avimedi$plan$str
##D # simple ordination
##D coa1 <- dudi.coa(avimedi$fau, scan = FALSE, nf = 3)
##D # within region
##D w1 <- wca(coa1, avimedi$plan$reg, scan = FALSE)
##D # no region the same result
##D pcaivnonA <- pcaivortho(coa1, avimedi$plan$reg, scan = FALSE)
##D summary(pcaivnonA)
##D # region + strate
##D interAplusB <- pcaiv(coa1, avimedi$plan, scan = FALSE)
##D 
##D if(adegraphicsLoaded()) {
##D   g1 <- s.class(coa1$li, cla, psub.text = "Sans contrainte", plot = FALSE)
##D   g21 <- s.match(w1$li, w1$ls, plab.cex = 0, psub.text = "Intra Région", plot = FALSE)
##D   g22 <- s.class(w1$li, cla, plot = FALSE)
##D   g2 <- superpose(g21, g22)
##D   g31 <- s.match(pcaivnonA$li, pcaivnonA$ls, plab.cex = 0, psub.tex = "Contrainte Non A", 
##D     plot = FALSE)
##D   g32 <- s.class(pcaivnonA$li, cla, plot = FALSE)
##D   g3 <- superpose(g31, g32)
##D   g41 <- s.match(interAplusB$li, interAplusB$ls, plab.cex = 0, psub.text = "Contrainte A + B", 
##D     plot = FALSE)
##D   g42 <- s.class(interAplusB$li, cla, plot = FALSE)
##D   g4 <- superpose(g41, g42)
##D   G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
##D 
##D } else {
##D   par(mfrow = c(2, 2))
##D   s.class(coa1$li, cla, sub = "Sans contrainte")
##D   s.match(w1$li, w1$ls, clab = 0, sub = "Intra Région")
##D   s.class(w1$li, cla, add.plot = TRUE)
##D   s.match(pcaivnonA$li, pcaivnonA$ls, clab = 0, sub = "Contrainte Non A")
##D   s.class(pcaivnonA$li, cla, add.plot = TRUE)
##D   s.match(interAplusB$li, interAplusB$ls, clab = 0, sub = "Contrainte A + B")
##D   s.class(interAplusB$li, cla, add.plot = TRUE)
##D   par(mfrow = c(1,1))
##D }
## End(Not run)


