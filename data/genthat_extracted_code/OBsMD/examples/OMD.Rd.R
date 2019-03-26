library(OBsMD)


### Name: OMD
### Title: Objective Model Discrimination (OMD) in Follow-Up Experiments
### Aliases: OMD
### Keywords: design

### ** Examples

library(OBsMD)
data(OBsMD.es5, package="OBsMD")
X <- as.matrix(OBsMD.es5[,1:5])
y <- OBsMD.es5[,6]
es5.OBsProb <- OBsProb(X=X,y=y,blk=0,mFac=5,mInt=2,nTop=32)
nMod <- 26
Xcand <- matrix(c(-1,	-1,	-1, -1,	-1,
1,	-1,	-1,	-1,	-1,
-1,	1,	-1,	-1,	-1,
1,	1,	-1,	-1,	-1,
-1,	-1,	1,	-1,	-1,
1,	-1,	1,	-1,	-1,
-1,	1,	1,	-1,	-1,
1,	1,	1,	-1,	-1,
-1,	-1,	-1,	1,	-1,
1,	-1,	-1,	1,	-1,
-1,	1,	-1,	1,	-1,
1,	1,	-1,	1,	-1,
-1,	-1,	1,	1,	-1,
1,	-1,	1,	1,	-1,
-1,	1,	1,	1,	-1,
1,	1,	1,	1,	-1,
-1,	-1,	-1,	-1,	1,
1,	-1,	-1,	-1,	1,
-1,	1,	-1,	-1,	1,
1,	1,	-1,	-1,	1,
-1,	-1,	1,	-1,	1,
1,	-1,	1,	-1,	1,
-1,	1,	1,	-1,	1,
1,	1,	1,	-1,	1,
-1,	-1,	-1,	1,	1,
1,	-1,	-1,	1,	1,
-1,	1,	-1,	1,	1,
1,	1,	-1,	1,	1,
-1,	-1,	1,	1,	1,
1,	-1,	1,	1,	1,
-1,	1,	1,	1,	1,
1,	1,	1,	1,	1
),nrow=32,ncol=5,dimnames=list(1:32,c("A","B","C","D","E")),byrow=TRUE)
p_omd <- OMD(OBsProb=es5.OBsProb,nFac=5,nBlk=0,nMod=26,nFoll=4,Xcand=Xcand,
mIter=20,nStart=25,startDes=NULL,top=30)
print(p_omd)



