library(metRology)


### Name:  bootMSD 
### Title: Parametric bootstrap for median scaled difference
### Aliases: ' bootMSD ' ' bootMSD.MSD ' ' bootMSD.default '
### Keywords: univar

### ** Examples


  data(Pb)
  ## Not run: 
##D   #Default method:
##D   set.seed(1023)
##D   boot.Pb.default <- bootMSD(Pb$value, Pb$u)  # Uses individual standard uncertainties
##D   summary(boot.Pb.default)
##D   
##D   
##D   #Method for MSD object:
##D   msd.Pb<-msd(Pb$value, Pb$u)  # Uses individual standard uncertainties
##D   boot.Pb <- bootMSD(msd.Pb, B=5000)
##D   	#Increased replication compared to default
##D   summary(boot.Pb)
##D   
##D   # NOTE: The default summary gives individual observation p-values. 
##D   # To correct for multiple comparisons, apply 
##D   # a suitable p-value adjustment:
##D   summary(boot.Pb, p.adjust="holm")
##D 
##D   
## End(Not run)





