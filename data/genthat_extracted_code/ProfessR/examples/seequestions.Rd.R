library(ProfessR)


### Name: seequestions
### Title: See Questions Sequentially
### Aliases: seequestions
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
##D 
##D cbind( seequestions(kbank[[1]]) )
##D 
##D 
##D 
## End(Not run)









