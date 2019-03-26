library(magclass)


### Name: getNames
### Title: Get dataset names
### Aliases: getNames getNames<- getNames<-

### ** Examples


 a <- as.magpie(1)
 getNames(a)
 setNames(a,"bla")
 
 x <- new.magpie("GLO",2000,c("a.o1","b.o1","a.o2"))
 getNames(x,dim=2)
 
 getSets(x,fulldim=FALSE)[3] <- "bla.blub"
 getNames(x,dim="bla")
 
 getSets(x)[4] <- "ble"
 getNames(x,dim="ble") <- c("Hi","Bye")
 x




