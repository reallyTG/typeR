library(nlrx)


### Name: setnl<-
### Title: Setter function to set a variable of a nl object
### Aliases: setnl<- setnl

### ** Examples

# Example for Wolf Sheep Predation model from NetLogo models library:
nl <- nl(
nlpath = "/home/user/NetLogo 6.0.3/",
modelpath = "/home/user/NetLogo 6.0.3/app/models/Sample Models/Biology/Wolf Sheep Predation.nlogo",
jvmmem = 1024)

# set NetLogo version
setnl(nl, "nlversion") <- "6.0.3"




