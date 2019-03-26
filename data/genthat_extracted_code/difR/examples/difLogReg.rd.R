library(difR)


### Name: difLogReg
### Title: General logistic regression DIF method
### Aliases: difLogReg

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Few examples
##D  difLogReg(Data=verbal[,1:24], group=verbal[,26], focal.name=1)
##D  difLogReg(Data = verbal[,1:24], group = verbal[,26], focal.name = 1, match = verbal[,25])
##D  difLogReg(Data = verbal[,1:24], group = verbal[,25], focal.name = 1, group.type = "cont")
##D 
##D  group<-rep("WomanLow",nrow(verbal))
##D  group[Anger>20 & Gender==0] <- "WomanHigh"
##D  group[Anger<=20 & Gender==1] <- "ManLow"
##D  group[Anger>20 & Gender==1] <- "ManHigh"
##D  names <- c("WomanHigh", "ManLow", "ManHigh")
##D 
##D  difLogReg(Data = verbal[,1:24], group = group, focal.name = names)
##D  
## End(Not run)
 


