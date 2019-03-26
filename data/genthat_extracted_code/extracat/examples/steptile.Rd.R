library(extracat)


### Name: steptile
### Title: stepwise reordering
### Aliases: steptile
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D 
##D # scaled numeric variables from the olives data
##D # and 20 k-means solutions
##D so <- scale(olives[,3:10])
##D rr <- replicate(20,{
##D 	kmeans(so,8)$cluster
##D })
##D 
##D # par(mfrow=c(3,1))
##D 
##D # initial cluster orders
##D x <- as.data.frame(cbind(olives[,1:2],rr))
##D require(scales)
##D scpcp(x, sel = "data[,1]",
##D 		 sel.palette="rgb", col.opt=list(alpha=0.5))
##D 
##D # reordering using steptile. 
##D # optile does not work for the complete table since it has 9*3*2^60 > 3E19 entries
##D # colors by the first unordered example:
##D 
##D x2 <- steptile(x, k = 4)
##D scpcp(x2, sel = "match(data[,1],levels(.GlobalEnv$x[,1]))", 
##D 		sel.palette="rgb", col.opt=list(alpha=0.5))
##D 
##D 
##D # additionally reordering the variables ... cmat takes about 20-30 seconds
##D CM <- cmat(x[,3:22])
##D require(seriation)
##D sM <- get_order(seriate(1-CM))
##D 
##D x3 <- steptile(x2[, c(1,2,2+sM,23)], k = 4)
##D 
##D scpcp(x3, sel = "match(data[,1],levels(.GlobalEnv$x[,1]))",
##D 		 sel.palette="rgb", col.opt=list(alpha=0.5))
##D 
## End(Not run)




