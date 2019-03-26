library(rankdist)


### Name: RankData-class
### Title: RankData Class
### Aliases: RankData RankData-class

### ** Examples

# creating a data set with only complete rankings
rankmat <- replicate(10,sample(1:52,52), simplify = "array")
countvec <- sample(1:52,52,replace=TRUE)
rankdat <- new("RankData",ranking=rankmat,count=countvec)
# creating a data set with both complete and top-10 rankings
rankmat_in <- replicate(10,sample(1:52,52), simplify = "array")
rankmat_in[rankmat_in>11] <- 11
rankmat_total <- cbind(rankmat_in, rankmat)
countvec_total <- c(countvec,countvec)
rankdat2 <- new("RankData",ranking=rankmat_total,count=countvec_total, nobj=52, topq=c(10,51))



