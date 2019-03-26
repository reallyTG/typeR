library(repfdr)


### Name: hconfigs
### Title: Enumeration of all possible vectors of association status.
### Aliases: hconfigs

### ** Examples


(H <- hconfigs(n.studies = 3))
# in replication analysis the non-null vectors are:
H[apply(H,1,function(y){ sum(y==1)>1 | sum(y==-1)>1 }),]
# in meta-analysis there is only one null vector (c(0,0,0)):
H[rowSums(abs(H))!=0,]

hconfigs(n.studies = 3, n.association.status= 2)



