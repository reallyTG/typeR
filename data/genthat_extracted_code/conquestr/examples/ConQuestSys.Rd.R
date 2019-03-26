library(conquestr)


### Name: ConQuestSys
### Title: ConQuestSys
### Aliases: ConQuestSys

### ** Examples

mySysData<- ConQuestSys()
myEx1SysData<- ConQuestSys(myCqs = system.file("extdata", "Ex1.cqs", package = "conquestr"))
## Not run: 
##D # if you run the above example this will return your original 'ACER ConQuest' syntax.
##D cat(unlist(myEx1SysData$gCommandHistory))
## End(Not run)



