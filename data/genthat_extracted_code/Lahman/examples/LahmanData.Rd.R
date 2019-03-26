library(Lahman)


### Name: LahmanData
### Title: Lahman Datasets
### Aliases: LahmanData
### Keywords: datasets

### ** Examples

data(LahmanData)

# find ID variables in the datasets
IDvars <- lapply(LahmanData[,"file"], function(x) grep('.*ID$', colnames(get(x)), value=TRUE))
names(IDvars) <- LahmanData[,"file"]
str(IDvars)
# vector of unique ID variables
unique(unlist(IDvars))

# which datasets have playerID?
names(which(sapply(IDvars, function(x) "playerID" %in% x)))

################################################
# Visualize relations among datasets via an MDS
################################################
# jaccard distance between two sets; assure positivity
jaccard <- function(A, B) {
	max(1 - length(intersect(A,B)) / length(union(A,B)), .00001)
}	

distmat <- function(vars, FUN=jaccard) {
	nv <- length(vars)
	d <- matrix(0, nv, nv, dimnames=list(names(vars), names(vars)))
	for(i in 1:nv) {
		for (j in 1:nv) {
			if (i != j) d[i,j] <- FUN(vars[[i]], vars[[j]])
		}
	}
	d
}

# do an MDS on distances
distID <- distmat(IDvars)
config <- cmdscale(distID)

pos=rep(1:4, length=nrow(config))
plot(config[,1], config[,2], xlab = "", ylab = "", asp = 1, axes=FALSE,
	main="MDS of ID variable distances of Lahman tables")
abline(h=0, v=0, col="gray80")
text(config[,1], config[,2], rownames(config), cex = 0.75, pos=pos, xpd=NA)




