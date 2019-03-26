library(ProfessR)


### Name: COMPbank
### Title: Compare Question Banks
### Aliases: COMPbank
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
##D q2 = COMPbank(Kbank, kbank[[3]] )
##D 
##D ###########  to extract these:
##D subq2 = subsetbank(kbank[[3]] , q2)
##D ###########  to get the overlapping questions:
##D 
##D olap = 1:length(kbank[[3]])
##D olap[-q2]
##D 
##D 
## End(Not run)





