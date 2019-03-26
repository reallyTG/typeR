library(ProfessR)


### Name: subsetbank
### Title: Subset a Question Bank
### Aliases: subsetbank
### Keywords: misc

### ** Examples


## Not run: 
##D LF = list.files(path="/home/lees/Class/GEOL_105/TESTBANK/EXAM_1", pattern="txt", full.names=TRUE )
##D 
##D kbank = vector(mode='list')
##D ######   read in the question banks, each in one file
##D for(i in 1:length(LF))
##D   {
##D     h = Get.testbank(LF[i])
##D     kbank[[i]] = Get.testbank(LF[i])
##D 
##D   }
##D names(kbank) = LF
##D Kbank =  vector(mode='list')
##D 
##D for(i in 1:length(kbank))
##D   {
##D 
##D Kbank = c(Kbank, kbank[[i]])
##D 
##D   }
##D 
##D ##########   get 50 odd numbered sample questions
##D 
##D isel = seq(from=1, to=100, by=2)
##D 
##D oddset1 = subsetbank(Kbank, isel)
##D 
## End(Not run)





