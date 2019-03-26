library(ade4)


### Name: presid2002
### Title: Results of the French presidential elections of 2002
### Aliases: presid2002
### Keywords: datasets

### ** Examples

data(presid2002)
all((presid2002$tour2$Chirac + presid2002$tour2$Le_Pen) == presid2002$tour2$exprimes)

## Not run: 
##D data(elec88)
##D data(cnc2003)
##D w0 <- ade4:::area.util.class(elec88$area, cnc2003$reg)
##D w1 <- scale(elec88$tab$Chirac)
##D w2 <- scale(presid2002$tour1$Chirac / presid2002$tour1$exprimes)
##D w3 <- scale(elec88$tab$Mitterand)
##D w4 <- scale(presid2002$tour2$Chirac / presid2002$tour2$exprimes)
##D 
##D if(adegraphicsLoaded()) {
##D   g1 <- s.value(elec88$xy, w1, Sp = elec88$Spatial, pSp.col = "white", pgrid.draw = FALSE, 
##D     psub.text = "Chirac 1988 T1", plot = FALSE)
##D   g2 <- s.value(elec88$xy, w2, Sp = elec88$Spatial, pSp.col = "white", pgrid.draw = FALSE, 
##D     psub.text = "Chirac 2002 T1", plot = FALSE)
##D   g3 <- s.value(elec88$xy, w3, Sp = elec88$Spatial, pSp.col = "white", pgrid.draw = FALSE, 
##D     psub.text = "Mitterand 1988 T1", plot = FALSE)
##D   g4 <- s.value(elec88$xy, w4, Sp = elec88$Spatial, pSp.col = "white", pgrid.draw = FALSE, 
##D     psub.text = "Chirac 2002 T2", plot = FALSE)
##D   G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
##D       
##D } else {
##D   par(mfrow = c(2, 2))
##D   par(mar = c(0.1, 0.1, 0.1, 0.1))
##D 
##D   area.plot(w0)
##D   s.value(elec88$xy, w1, add.plot = TRUE)
##D   scatterutil.sub("Chirac 1988 T1", csub = 2, "topleft")
##D 
##D   area.plot(w0)
##D   s.value(elec88$xy, w2, add.plot = TRUE)
##D   scatterutil.sub("Chirac 2002 T1", csub = 2, "topleft")
##D   
##D   area.plot(w0)
##D   s.value(elec88$xy, w3, add.plot = TRUE)
##D   scatterutil.sub("Mitterand 1988 T1", csub = 2, "topleft")
##D   
##D   area.plot(w0)
##D   s.value(elec88$xy, w4, add.plot = TRUE)
##D   scatterutil.sub("Chirac 2002 T2", csub = 2, "topleft")
##D }
## End(Not run)


