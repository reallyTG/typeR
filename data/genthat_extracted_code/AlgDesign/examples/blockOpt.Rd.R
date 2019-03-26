library(AlgDesign)


### Name: optBlock
### Title: Optimal design blocking
### Aliases: optBlock
### Keywords: design

### ** Examples

# Blocking the design for a quadratic polynomial in three variables into two 
# seven trial blocks:

dat<-gen.factorial(3,3,varNames=c("A","B","C"))
desD<-optFederov(~quad(.),dat,nTrials=14,eval=TRUE) # Choose an optimum 14 trail design.
optBlock(~quad(.),desD$design,c(7,7))

# Letting optBlock() search the dat candidate list instead of first choosing a 
# 14 trial design.
optBlock(~quad(.),dat,c(7,7))


# A block design for 7 treatments in 7 blocks of size 3. Note how withinData 
# is recycled to fill out the blocksize requirements.

BIB<-optBlock(~.,withinData=factor(1:7),blocksizes=rep(3,7))

# This is a balanced incomplete block design as may be seen from:

crossprod(table(BIB$rows,c(rep(1:7, rep(3,7)))))

# A partially balanced incomplete block design with two associate classes:

tr<-factor(1:9)
PBIB<-optBlock(~.,withinData=tr,blocksizes=rep(3,9))

crossprod(table(PBIB$rows,c(rep(1:9, rep(3,9)))))


# Two fractions of a 2^(4-1).

dat<-gen.factorial(2,4)
od<-optBlock(~.,dat,c(8,8)) 

# The blocks are not themselves orthogonal even though the entire design is optimal.

bk<-data.matrix(od$Blocks$B1)
t(bk)%*%bk 

# Better blocks may be obtained as follows, but note that they are not generally 
# the fractions that would be obtained by confounding the third order interaction.

od<-optBlock(~.,dat,c(8,8),criterion="Dpc",nR=10)
bk<-data.matrix(od$Blocks$B1)
t(bk)%*%bk

# Blocking with whole plot factors. Note that the 27 rows of within are recycled 
# to make the 54 trial blocked design. 

within<-expand.grid(A=c(-1,0,1),B=c(-1,0,1),C=c(-1,0,1))
whole<-expand.grid(D=factor(1:3),E=factor(1:3))
od<-optBlock(~D+E*(quad(A,B,C)),withinData=within,blocksizes=rep(6,9),wholeBlockData=whole)

# Either withinData, or wholeBlockData may be an approximate theory optimial design 
# produced by optFederov() for nTrials. The first column in the optFederov() output 
# design, named "Rep..", is used to replicate the trials. 

within<-optFederov(~quad(A,B,C),within,nT=54,approx=TRUE)
od<-optBlock(~D+E*(quad(A,B,C)),withinData=within$design,blocksizes=rep(6,9),wholeBlockData=whole)




