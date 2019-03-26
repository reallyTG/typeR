library(dst)


### Name: extmin
### Title: Extension of a relation
### Aliases: extmin

### ** Examples

# Naking an empty reference relation with mass(frame) = 1 and
# extending a bca to its space.
init_tt= matrix(rep(1,10),nrow=1, 
dimnames =list(NULL, c("3", "2", "1", "0", 
 "true", "false",  "foul", "fair",  "true", "false")) )
 init_spec <- matrix(c(1,1), ncol = 2, 
 dimnames = list(NULL, c("specnb", "mass")))
 init_info <- matrix(c(3,4,7,8,4,2,2,2), ncol = 2,
  dimnames = list(NULL, c("varnb", "size")) )
 relRef <- bcaRel(tt = init_tt, spec = init_spec,
  infovar = init_info, 
  infovarnames = c("Sail", "Loading", "Weather", "Repairs"),
  relnb = 0)
 # a bcaspec defined on one variable
 l_rel <- bca(f=matrix(c(1,0,1,0,1,1), ncol=2), 
 m=c(0.3,0.5,0.2), cnames=c("true", "false"), 
 infovar=matrix(c(4,2), ncol = 2, 
 dimnames = list(NULL, c("varnb", "size"))), 
 infovarnames= c("Loading"), 
 inforel= matrix(c(7,1), ncol = 2, 
 dimnames = list(NULL, c("relnb", "depth"))))
 z <- extmin(l_rel, relRef)
 prmatrix(t(z$tt), collab = rep("", nrow(z$tt)))
 



