library(ade4)


### Name: macroloire
### Title: Assemblages of Macroinvertebrates in the Loire River (France)
### Aliases: macroloire
### Keywords: datasets

### ** Examples

    data(macroloire)
    apqe.Equi <- apqe(macroloire$fau, , macroloire$morphoregions)
    apqe.Equi
    #test.Equi <- randtest.apqe(apqe.Equi, method = "aggregated", 99)
    #plot(test.Equi)

    ## Not run: 
##D  
##D 
##D     m.phy <- taxo2phylog(macroloire$taxo)
##D     apqe.Tax <- apqe(macroloire$fau, m.phy$Wdist, macroloire$morphoregions)
##D     apqe.Tax
##D     #test.Tax <- randtest.apqe(apqe.Tax, method = "aggregated", 99)
##D     #plot(test.Tax)
##D 
##D     dSize <- sqrt(dist.prop(macroloire$traits[ ,1:4], method = 2))
##D     apqe.Size <- apqe(macroloire$fau, dSize, macroloire$morphoregions)
##D     apqe.Size
##D     #test.Size <- randtest.apqe(apqe.Size, method = "aggregated", 99)
##D     #plot(test.Size)
##D 
##D     dFeed <- sqrt(dist.prop(macroloire$traits[ ,-(1:4)], method = 2))
##D     apqe.Feed <- apqe(macroloire$fau, dFeed, macroloire$morphoregions)
##D     apqe.Feed
##D     #test.Feed <- randtest.apqe(apqe.Feed, method = "aggregated", 99)
##D     #plot(test.Size)
##D 
##D     
## End(Not run)




