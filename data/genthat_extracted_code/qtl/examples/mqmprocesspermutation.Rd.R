library(qtl)


### Name: mqmprocesspermutation
### Title: Convert mqmmulti objects into a scanoneperm object
### Aliases: mqmprocesspermutation
### Keywords: models

### ** Examples

# QTL at chromosome 3
f2qtl <- c(3,15,1,0)

# Mouse genetic map
data(map10)

## Don't show: 
map10 <- map10[1:3]
## End(Don't show)
# Simulate a F2 Cross
f2cross <- sim.cross(map10,f2qtl,n=100,type="f2")
## Not run: 
##D # Bootstrap MQM mapping on the f2cross
##D f2result <- mqmpermutation(f2cross,scanfunction=mqmscan)
## End(Not run)## Don't show: 
f2result <- mqmpermutation(f2cross,scanfunction=mqmscan, n.perm=2, batchsize=2)
## End(Don't show)

# Create a permutation object
f2perm <- mqmprocesspermutation(f2result)

# What LOD score is considered significant?
summary(f2perm)



