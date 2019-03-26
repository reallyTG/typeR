library(pscl)


### Name: rollcall
### Title: create an object of class rollcall
### Aliases: rollcall
### Keywords: manip

### ** Examples

## generate some fake roll call data
set.seed(314159265)
fakeData <- matrix(sample(x=c(0,1),size=5000,replace=TRUE),
                   50,100)
rc <- rollcall(fakeData)
is(rc,"rollcall")        ## TRUE
rc                       ## print the rollcall object on screen

data(sc9497)             ## Supreme Court example data
rc <- rollcall(data=sc9497$votes,
               legis.names=sc9497$legis.names,
               desc=sc9497$desc)
summary(rc,verbose=TRUE)                      

## Not run: 
##D ## s107
##D ## could use readKH for this
##D dat <- readLines("sen107kh.ord")
##D dat <- substring(dat,37)
##D mat <- matrix(NA,ncol=nchar(dat[1]),nrow=length(dat))
##D for(i in 1:103){
##D   mat[i,] <- as.numeric(unlist(strsplit(dat[i],
##D                                         split=character(0))))
##D }
##D 
##D s107 <- rollcall(mat,
##D                  yea=c(1,2,3),
##D                  nay=c(4,5,6),
##D                  missing=c(7,8,9),
##D                  notInLegis=0,
##D                  desc="107th U.S. Senate",
##D                  source="http://voteview.ucsd.edu")
##D summary(s107)
## End(Not run)



