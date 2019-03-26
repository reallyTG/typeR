library(Xmisc)


### Name: valid.arg.index
### Title: Check validity of an index
### Aliases: valid.arg.index

### ** Examples

ll <- list(11,12,13,a=14,b=15,16,17,c=18,19)
valid.arg.index(ll,-1) # non-existing index
valid.arg.index(ll,0)  # non-existing index
valid.arg.index(ll,1)  # valid index
valid.arg.index(ll,2)  # valid index
valid.arg.index(ll,5)  # invalid index
valid.arg.index(ll,10) # non-existing index
valid.arg.index(ll,"a")# valid name
valid.arg.index(ll,"e")# non-existing name
valid.arg.index(ll,5,safe=FALSE) # still return the index



