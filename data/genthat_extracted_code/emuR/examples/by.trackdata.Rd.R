library(emuR)


### Name: by.trackdata
### Title: A method of the generic function by for objects of class
###   \'trackdata\'
### Aliases: by.trackdata by
### Keywords: methods

### ** Examples


  data(demo.vowels)
  data(demo.vowels.fm)


   #mean F1 subsumed for each vowel
   ################################
   lab = label(demo.vowels)
   by(demo.vowels.fm[,1], lab ,sapply,mean,simplify=FALSE)


   #mean F1 subsumed for segment onsets mids and offsets
   ##############################################
   data = demo.vowels.fm
   llabs = NULL
   for (ind in 1:dim(data$ftime)[1]) {
     seglabs = rep("mid",data$index[ind,2]-data$index[ind,1]+1)
     seglabs[1] = "on"
     seglabs[length(seglabs)] = "off"
     llabs = as.vector(c(llabs , seglabs))
   }

   by(demo.vowels.fm[,1], llabs , sapply, mean , simplify=FALSE)

   #mean F1 subsumed for segment onsets mids and offsets subsumed for each vowel
   #####################################################################
   by(demo.vowels.fm[,1], list(lab = lab, llabs = llabs) , sapply, mean , simplify=FALSE)






