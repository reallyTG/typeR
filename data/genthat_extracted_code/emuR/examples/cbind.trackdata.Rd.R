library(emuR)


### Name: cbind.trackdata
### Title: A method of the generic function cbind for objects of class
###   \'trackdata\'
### Aliases: cbind.trackdata cbind
### Keywords: methods

### ** Examples


   data(vowlax)
   
   #segment list vowlax - first segment only 
   vowlax[1,]
   
   #F0 track data object for vowlax - first segment only 
   vowlax.fund[1,]
   
   #rms track data object for vowlax - first segment only 
   vowlax.rms[1,]
      
   
   #now combine both track data objects
   fund.rms.lax = cbind(vowlax.fund, vowlax.rms)
   
   #the combined track data object - first segment only
   #The first column keeps vowlax.fund data, the second keeps vowlax.rms data 
   fund.rms.lax[1,]





