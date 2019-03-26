library(emuR)


### Name: rbind.trackdata
### Title: A method of the generic function rbind for objects of class
###   trackdata
### Aliases: rbind.trackdata rbind
### Keywords: methods

### ** Examples


   data(vowlax)
   
   #segment list vowlax - first segment only 
   vowlax[1,]
   
   #F0 track data object for vowlax - first segment only 
   vowlax.fund[1]
   
   #rms track data object for vowlax - first segment only 
   vowlax.rms[1]
   
   #now combine both track data objects
   fund.rms.lax = rbind(vowlax.fund[1:10,], vowlax.rms[1:10,])
 
   #the combined track data object
   #The first ten rows in \$data keep vowlax.fund data, the 11th to last row keeps vowlax.rms data 
   fund.rms.lax
   





