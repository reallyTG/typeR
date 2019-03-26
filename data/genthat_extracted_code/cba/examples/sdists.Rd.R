library(cba)


### Name: sdists
### Title: Sequence Distance Computation
### Aliases: sdists
### Keywords: cluster

### ** Examples

### numeric data
sdists(list(c(2,2,3),c(2,4,3)))			# 2
sdists(list(c(2,2,3),c(2,4,3)),weight=c(1,1,0,1)) # 1

### character data
w <- matrix(-1,nrow=8,ncol=8)			# weight/score matrix for
diag(w) <- 0					# longest common subsequence
colnames(w) <- c("",letters[1:7])
x <- sapply(rbinom(3,64,0.5),function(n,x)
    paste(sample(x,n,rep=TRUE),collapse=""),
    colnames(w)[-1])
x
sdists(x,method="aw",weight=w)
sdists(x,x,method="aw",weight=w)		# check
## pairwise
sdists(x,rev(x),method="aw",weight=w,pairwise = TRUE)
diag(w) <- seq(0,7)
sdists(x,method="aw", weight=w)			# global alignment
sdists(x,method="awl",weight=w)			# local alignment

## empty strings
sdists("", "FOO")
sdists("", list(c("F","O","O")))
sdists("", list(""))				# space symbol
sdists("", "abc", method="aw", weight=w)
sdists("", list(""), method="aw", weight=w)

### asymmetric weights
w[] <- matrix(-sample(0:5,64,TRUE),ncol=8)
diag(w) <- seq(0,7)
sdists(x,x,method="aw", weight=w)
sdists(x,x,method="awl",weight=w)

### missing values
sdists(list(c(2,2,3),c(2,NA,3)),exclude=NULL)	# 2 (include anything)
sdists(list(c(2,2,3),c(2,NA,3)),exclude=NA)	# NA




