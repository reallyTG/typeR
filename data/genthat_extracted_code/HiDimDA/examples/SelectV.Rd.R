library(HiDimDA)


### Name: SelectV
### Title: Variable Selection for High-Dimensional Supervised
###   Classification.
### Aliases: SelectV

### ** Examples


## Not run: 
##D 
##D # Compare the number of variables selected by the four methods 
##D # currently available  on Alon's Colon Cancer Data set 
##D # after a logarithmic transformation. 
##D 
##D log10genes <- log10(AlonDS[,-1])
##D 
##D Res <- array(dim=4)
##D names(Res) <- c("ExpHC","HC","Fdr","Fair")
##D Res[1] <- SelectV(log10genes,AlonDS[,1])$nvkpt
##D Res[2] <- SelectV(log10genes,AlonDS[,1],Selmethod="HC")$nvkpt
##D Res[3] <- SelectV(log10genes,AlonDS[,1],Selmethod="Fdr")$nvkpt
##D Res[4] <- SelectV(log10genes,AlonDS[,1],Selmethod="Fair")$nvkpt
##D 
##D print(Res)
## End(Not run)




