library(ProfessR)


### Name: Get.testbank
### Title: Get Test Bank From Ascii Text Files
### Aliases: Get.testbank
### Keywords: misc

### ** Examples


## Not run: 
##D fn = "MY.questions"
##D Qbank = Get.testbank(fn)
##D 
##D ##########  use existing database:
##D data(QBANK1)
##D #####  dump out question bank in correct format:
##D DUMPbank("my.questions", QBANK1, sep = "\n")
##D ###  read it in:
##D QB1=Get.testbank("my.questions")
##D 
##D 
## End(Not run)




