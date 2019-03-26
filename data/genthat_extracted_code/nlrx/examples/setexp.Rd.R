library(nlrx)


### Name: setexp<-
### Title: Setter function to set a variable of an experiment object
### Aliases: setexp<- setexp

### ** Examples


# Example for Wolf Sheep Predation model from NetLogo models library:
nl <- nl(nlversion = "6.0.3",
nlpath = "/home/user/NetLogo 6.0.3/",
modelpath = "/home/user/NetLogo 6.0.3/app/models/Sample Models/Biology/Wolf Sheep Predation.nlogo",
jvmmem = 1024)

# Set experiment name
setexp(nl, "expname") <- "experimentName"




