library(EcoGenetics)


### Name: eco.gsa
### Title: Global spatial analysis
### Aliases: eco.gsa

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D 
##D # Moran's I 
##D 
##D ### one test
##D con <- eco.weight(eco[["XY"]], method = "circle", d1 = 0, d2 = 2)
##D global <- eco.gsa(Z = eco[["P"]][, 1], con = con, method = "I", nsim = 200)
##D global
##D 
##D require(adegenet)
##D con2<-chooseCN(eco[["XY"]], type = 1, result.type = "listw", plot.nb = FALSE)
##D global <- eco.gsa(Z = eco[["P"]][, 1], con = con2, method = "I", nsim = 200)
##D global
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accesed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D # observed value
##D ecoslot.OBS(global)
##D 
##D # p-value
##D ecoslot.PVAL(global)
##D 
##D #----------------
##D # multiple tests
##D #----------------
##D data(eco3)
##D con <- eco.weight(eco3[["XY"]], method = "circle", d1 = 0, d2 = 500)
##D global <- eco.gsa(Z = eco3[["P"]], con = con, method = "I", nsim = 200)
##D global 
##D # Plot method for multivariable eco.gsa objects:
##D eco.plotGlobal(global)
##D 
##D #--------------------------------
##D # accessor use in multiple tests
##D #--------------------------------
##D 
##D ecoslot.MULTI(global)
##D 
##D 
##D #----------------------------------------
##D 
##D # Gearys's C 
##D 
##D con <- eco.weight(eco[["XY"]], method = "circle", d1 = 0, d2 = 2)
##D global.C <- eco.gsa(Z = eco[["P"]][, 1], con = con, method = "C", nsim = 200)
##D global.C
##D 
##D #----------------------------------------
##D 
##D # Bivariate's Moran's Ixy
##D 
##D con <- eco.weight(eco[["XY"]], method = "circle", d1 = 0, d2 = 2)
##D global.Ixy <- eco.gsa(Z = eco[["P"]][, 1], Y = eco[["E"]][, 1], 
##D con = con, method = "CC", nsim = 200)
##D global.Ixy
##D 
##D #----------------------------------------
##D 
##D # Join-count
##D 
##D ## using the allelic frequency matrix of an ecogen object. 
##D ## The data is diploid. Frequencies are transformed into counts
##D ## as ploidy * frequency_matrix:
##D 
##D Z = 2* eco[["A"]]
##D 
##D 
##D jc <- eco.gsa(Z[, 1], con = con, method = "JC")
##D eco.plotGlobal(jc)
##D 
##D # multiple tests
##D # using the first ten alleles of the matrix
##D global.JC <- eco.gsa(Z[, 1:10], con = con, method = "JC", nsim = 99)
##D global.JC
##D # plot method for multivariable join-count
##D eco.plotGlobal(global.JC)
##D 
##D # counting joins between genotypes in the first locus the G matrix:
##D global.JC <- eco.gsa(Z = eco[["G"]][, 1], ploidy = 2, con = con, method = "JC", nsim = 99)
##D global.JC
##D eco.plotGlobal(global.JC)
##D 
## End(Not run)




