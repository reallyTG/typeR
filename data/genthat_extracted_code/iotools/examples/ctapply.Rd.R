library(iotools)


### Name: ctapply
### Title: Fast tapply() replacement functions
### Aliases: ctapply
### Keywords: manip

### ** Examples

i = rnorm(4e6)
names(i) = as.integer(rnorm(1e6))
i = i[order(names(i))]
system.time(tapply(i, names(i), sum))
system.time(ctapply(i, names(i), sum))

## ctapply() also works on matrices (unlike tapply)
m=matrix(c("A","A","B","B","B","C","A","B","C","D","E","F","","X","X","Y","Y","Z"),,3)
ctapply(m, m[,1], identity, MERGE=list)
ctapply(m, m[,1], identity, MERGE=rbind)
m2=m[,-1]
rownames(m2)=m[,1]
colnames(m2) = c("V1","V2")
ctapply(m2, rownames(m2), identity, MERGE=list)
ctapply(m2, rownames(m2), identity, MERGE=rbind)



