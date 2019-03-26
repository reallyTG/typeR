library(stm)


### Name: writeLdac
### Title: Write a .ldac file
### Aliases: writeLdac

### ** Examples


## Not run: 
##D 
##D #Convert the gadarian data into documents format
##D temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
##D documents <- temp$documents
##D #Now write out to an ldac file
##D writeLdac(documents, file="gadarian.ldac")
## End(Not run)



