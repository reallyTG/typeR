library(cba)


### Name: sdists.trace
### Title: Edit Transcripts and Sequence Alignments
### Aliases: sdists.trace
### Keywords: cluster

### ** Examples

### from the book
x1 <- "vintner"
y1 <- "writers"
b1 <- sdists.trace(x1, y1, weight=c(1,1,0,1))
b1
## longest common subsequence ?
sdists.trace("a","b", weight=c(0,0,-1,0))
## from the book
w2 <- matrix(-2,ncol=13,nrow=13)
w2[1,] <- w2[,1] <- -1
diag(w2) <- c(0,rep(2,12))
x2 <- "pqraxabcstvq"
y2 <- "xyaxbacsll"
colnames(w2) <- c("",unique(strsplit(paste(x2, y2, sep = ""),"")[[1]]))
b2 <- sdists.trace(x2, y2, method="awl", weight=w2)
b2
## alignment with different symbol sets
x3 <- "121314"
y3 <- "ABACAD"
w3 <- matrix(-1,nrow=5,ncol=5)
diag(w3) <- 0
rownames(w3) <- c("","1","2","3","4")
colnames(w3) <- c("","A","B","C","D")
b3 <- sdists.trace(x3, y3, method="aw", weight=w3)
b3
## partial
b4 <- sdists.trace(x1, y1, weight=c(1,1,0,1), partial = TRUE)
b4



