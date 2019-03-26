library(nbpMatching)


### Name: distancematrix
### Title: Distance matrix
### Aliases: distancematrix distancematrix,character-method
###   distancematrix,data.frame-method distancematrix,list-method
###   distancematrix,matrix-method distancematrix-class

### ** Examples


plainmatrix<-as.matrix(dist(sample(1:25, 8, replace=TRUE)))
diag(plainmatrix) <- 99999  # setting diagonal to an infinite distance for
                           # pedagogical reasons (the diagonal may be left
                           # as zero)
mdm<-distancematrix(plainmatrix)
df <- data.frame(id=LETTERS[1:25], val1=rnorm(25), val2=rnorm(25))
df[sample(seq_len(nrow(df)), ceiling(nrow(df)*0.1)), 2] <- NA
df.dist <- gendistance(df, idcol=1, ndiscard=2)
mdm2 <- distancematrix(df.dist)




