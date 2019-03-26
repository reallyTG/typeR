library(aMNLFA)


### Name: aMNLFA.scores
### Title: aMNLFA score generating function
### Aliases: aMNLFA.scores
### Keywords: MNLFA

### ** Examples

 wd <- tempdir()
 first<-paste0(system.file(package='aMNLFA'),"/examplefiles")
 the.list <- list.files(first,full.names=TRUE)
 file.copy(the.list,wd,overwrite=TRUE)
 
 ob <- aMNLFA::aMNLFA.object(dir = wd, 
 mrdata = xstudy, 
 indicators = paste0("BIN_", 1:12),
 catindicators = paste0("BIN_", 1:12), 
 meanimpact = c("AGE", "GENDER", "STUDY"), 
 varimpact = c("AGE", "GENDER", "STUDY"), 
 measinvar = c("AGE", "GENDER", "STUDY"),
 factors = c("GENDER", "STUDY"),
 ID = "ID",
 thresholds = FALSE)
 
 aMNLFA.scores(ob)



