library(magclass)


### Name: getSets
### Title: Get sets
### Aliases: getSets getSets<- getSets<-

### ** Examples


 a <- new.magpie("GLO.1",2000,c("a.o1","b.o1","a.o2"))
 getSets(a) <- c("reg","cell","t","bla","blub")
 getSets(a)
 
 getSets(a)[4] <- "BLA"
 getSets(a,fulldim=FALSE)
 getSets(a)




