library(metRology)


### Name:  bootMSD-class 
### Title: Object returned by 'bootMSD' and associated methods.
### Aliases: ' bootMSD-class ' ' print.bootMSD' ' summary.bootMSD' '
###   print.summary.bootMSD' ' barplot.bootMSD' ' plot.bootMSD'
### Keywords: univar

### ** Examples


  ## Not run: 
##D   data(Pb)
##D   msd.Pb<-msd(Pb$value, Pb$u)  # Uses individual standard uncertainties
##D 
##D   set.seed(1023)
##D   boot.Pb <- bootMSD(msd.Pb)
##D   summary(boot.Pb)
##D 
##D   # The default summary gives individual observation p-values. To 
##D   # avoid over-interpretation for the study as a whole, 
##D   # apply a sensible p-value adjustment:
##D   summary(boot.Pb, p.adjust="holm")
##D 
##D   plot(boot.Pb, crit=TRUE)
##D 
##D   
## End(Not run)



