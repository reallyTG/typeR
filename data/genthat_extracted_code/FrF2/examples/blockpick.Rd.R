library(FrF2)


### Name: blockpick
### Title: Function to show potential block assignments
### Aliases: blockpick blockpick.big
### Keywords: array design

### ** Examples

## look at possibilities for running a 32 run design with 6 factors in 8 blocks
## running this without alias.block.2fis=TRUE throws an error: not possible
## Not run: blockpick(k=5,design="6-1.1",k.block=3)
## the 8th to 10th design have more clear 2fis than the earlier ones
blockpick(k=5,design="6-1.1",k.block=3,alias.block.2fis=TRUE)
## function FrF2 can be used to manually accomodate this 
des32.6fac.8blocks.MaxC2 <- FrF2(32,6,blocks=c(3,12,21))
summary(des32.6fac.8blocks.MaxC2)
## automatic block generation leads to more aliased 2fis
summary(FrF2(32,6,blocks=8,alias.block.2fis=TRUE))

## look at possibilities for blocking design 7-3.1 from Chen, Sun, Wu catalogue
blockpick(4,design="7-3.1",k.block=2,alias.block.2fis=TRUE)

## big design
## running this throws an error on many machines because of too little memory
## Not run: blockpick(6,design="7-1.2",k.block=5,alias.block.2fis=TRUE)
## for obtaining a design for this scenario with blockpick.big, 
## the number of factors must be increased to 7+k.block=12
## designs 12-6.1 and 12-6.2 dont do it, 12-6.3 does
bpb <- blockpick.big(6,design="12-6.3",k.block=5,alias.block.2fis=TRUE)
bpb
## based on the result of blockpick.big, a blocked design can be obtained as follows:
## (not run for saving check time on CRAN)
## Not run: 
##D des64.7fac.32blocks <- FrF2(64,gen=bpb$gen[1,], blocks = as.list(1:5), 
##D    alias.block.2fis=TRUE)
##D str(des64.7fac.32blocks)
##D ## if the seven factors are to be named A,...,G:
##D des64.7fac.32blocks <- FrF2(64,gen=bpb$gen[1,], blocks = as.list(1:5), 
##D    alias.block.2fis=TRUE, factor.names=c(paste("b",1:5,sep=""),Letters[1:7]))
##D str(des64.7fac.32blocks)
## End(Not run)



