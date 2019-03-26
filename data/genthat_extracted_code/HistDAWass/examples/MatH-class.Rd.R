library(HistDAWass)


### Name: MatH-class
### Title: Class MatH.
### Aliases: MatH-class MatH initialize,MatH-method MatH
### Keywords: classes

### ** Examples


##---- create a list of six distributionH objects
ListOfDist<-vector("list",6)
ListOfDist[[1]]<-distributionH(c(1,2,3),c(0, 0.4, 1))
ListOfDist[[2]]<-distributionH(c(7,8,10,15),c(0, 0.2, 0.7, 1))
ListOfDist[[3]]<-distributionH(c(9,11,20),c(0, 0.5, 1))
ListOfDist[[4]]<-distributionH(c(2,5,8),c(0, 0.3, 1))
ListOfDist[[5]]<-distributionH(c(8,10,15),c(0,  0.75, 1))
ListOfDist[[6]]<-distributionH(c(20,22,24),c(0, 0.12, 1))

## create a MatH object filling it by columns
MyMAT=new("MatH",nrows=3,ncols=2,ListOfDist=ListOfDist,
  names.rows=c("I1","I2","I3"), names.cols=c("Var1","Var2"),by.row=FALSE)

showClass("MatH")


#bulding an empty 10 by 4 matrix of histograms
MAT=MatH(nrows=10,ncols=4)



