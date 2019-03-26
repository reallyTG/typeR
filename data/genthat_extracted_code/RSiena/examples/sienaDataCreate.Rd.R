library(RSiena)


### Name: sienaDataCreate
### Title: Function to create a Siena data object
### Aliases: sienaDataCreate siena
### Keywords: classes

### ** Examples

mynet <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
mybeh <- sienaDependent(s50a, type="behavior")
mydata <- sienaDataCreate(mynet, mybeh)
## And for a two-mode network
mynet1 <- sienaDependent(array(c(s501, s502), dim=c(50, 50, 2)), nodeSet="senders")
senders <- sienaNodeSet(50, nodeSetName="senders")
receivers <- sienaNodeSet(30, nodeSetName="receivers")
mynet2 <- sienaDependent(array(c(s501[,1:30], s502[,1:30]), dim=c(50, 30, 2)),
      nodeSet=c("senders", "receivers"))
(mydata <- sienaDataCreate(mynet1, mynet2, nodeSets=list(senders, receivers)))
## Not run: 
##D print01Report(mydata, modelname = "mydescription")
## End(Not run)



