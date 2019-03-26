library(network)


### Name: network.extraction
### Title: Extraction and Replacement Operators for Network Objects
### Aliases: network.extraction %n% %n%<- %v% %v%<- %e% %e%<- %nattr%
###   %nattr%<- %vattr% %vattr%<- %eattr% %eattr%<- [.network [<-.network
### Keywords: graphs manip

### ** Examples

  #Create a random graph (inefficiently)
  g<-network.initialize(10)
  g[,]<-matrix(rbinom(100,1,0.1),10,10)
  plot(g)
  
  #Demonstrate edge addition/deletion
  g[,]<-0
  g[1,]<-1
  g[2:3,6:7]<-1
  g[,]
  
  #Set edge values
  g[,,names.eval="boo"]<-5
  as.sociomatrix(g,"boo")
  g %e% "hoo" <- "wah"
  g %e% "hoo"
  #Assignment input should be as adjacency matrix
  g %e% "age" <- matrix(1:100, 10, 10)
  g %e% "age"
  as.sociomatrix(g,"age")

  #Set/retrieve network and vertex attributes
  g %n% "blah" <- "Pork!"                 #The other white meat?
  g %n% "blah" == "Pork!"                 #TRUE!
  g %v% "foo" <- letters[10:1]            #Letter the vertices
  g %v% "foo" == letters[10:1]            #All TRUE



