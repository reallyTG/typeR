library(forestSAS)


### Name: nnIndex
### Title: Get the marks of nearest neighbour in the point pattern
### Aliases: nnIndex

### ** Examples

library(spatstat)
data(finpines)
#### Based on specific number (N=4) of nearest neighbour####
## Basic usage
nndN<-nnIndex(finpines,id=paste("T",1:126,sep=""),N=1,
              smark="diameter",buffer=TRUE,buf.xwid =2,buf.ywid=3)
nndN
nndhN<-nnIndex(finpines,id=paste("T",1:126,sep=""),N=4,
       smark=c("diameter","height"),buffer=TRUE,buf.xwid =2
       ,buf.ywid=3)
nndhN

# Only the points in the core zone (Removed the points in the buffer zone)
nndN_core<-nnIndex(finpines,id=paste("T",1:126,sep=""),N=4,
              smark="diameter",buffer=FALSE,buf.xwid =2,buf.ywid=3)
nndN_core
nndhN_core<-nnIndex(finpines,id=paste("T",1:126,sep=""),N=4,
         smark=c("diameter","height"),buffer=FALSE,buf.xwid =2,
         buf.ywid=3)
nndhN_core

## Remove some points, and then identify the marks of Nearest Neighbour
nndN.rm_core<-nnIndex(finpines,id=paste("T",1:126,sep=""),
                    rm.id=c("T1","T3","T8","T9","T59","T60","T120"),
            N=4,smark="diameter",buffer=FALSE,buf.xwid =2,buf.ywid=3)
nndN.rm_core

## add some points, and then identify the marks  of Nearest Neighbour
add.x=c(-2,-1,0,2,4)
add.y=c(-4,-3,-6,0,1)
add.marks=data.frame(diameter=c(2.0,3.0,4.0,5.0,6.0),
                     height=c(2.5,3.5,4.5,5.5,6.5))
add.Xdata=ppp(x=add.x,y=add.y,marks=add.marks,c(-5,5),c(-8,2))

nndN.add_core<-nnIndex(finpines,id=paste("T",1:126,sep=""),
                       add.X=add.Xdata,
                       add.id=paste("NT",1:5,sep=""),
          N=4,smark="diameter",buffer=FALSE,buf.xwid =2,buf.ywid=3)
nndN.add_core

#### Based on specific circular (R=5) of nearest neighbour####
## Basic usage
nndR<-nnIndex(finpines,id=paste("T",1:126,sep=""),R=0.5,
              smark="diameter",buffer=TRUE,buf.xwid =2,buf.ywid=3)
nndR
nndhR<-nnIndex(finpines,id=paste("T",1:126,sep=""),R=0.5,
              smark=c("diameter","height"),buffer=TRUE,
               buf.xwid =2,buf.ywid=3)
nndhR

# Only the points in the core zone (Removed the points in the buffer zone)
nndR_core<-nnIndex(finpines,id=paste("T",1:126,sep=""),R=0.5,
            smark="diameter",buffer=FALSE,buf.xwid =2,buf.ywid=3)
nndR_core
nndhR_core<-nnIndex(finpines,id=paste("T",1:126,sep=""),R=0.5,
            smark=c("diameter","height"),buffer=FALSE,
                    buf.xwid =2,buf.ywid=3)
nndhR_core

## Remove some points, and then identify the marks  of Nearest Neighbour
nndR.rm_core<-nnIndex(finpines,id=paste("T",1:126,sep=""),
                  rm.id=c("T1","T3","T8","T9","T59","T60","T120"),
          R=0.5,smark="diameter",buffer=FALSE,buf.xwid =2,buf.ywid=3)
nndR.rm_core

## add some points, and then identify the marks  of Nearest Neighbour
nndR.add_core<-nnIndex(finpines,id=paste("T",1:126,sep=""),
                       add.X=add.Xdata,
                       add.id=paste("NT",1:5,sep=""),
          R=0.5,smark="diameter",buffer=FALSE,buf.xwid =2,buf.ywid=3)
nndR.add_core



