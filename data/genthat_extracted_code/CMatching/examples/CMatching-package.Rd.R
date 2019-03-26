library(CMatching)


### Name: CMatching-package
### Title: Matching Algorithms for Causal Inference with Clustered Data
### Aliases: CMatching-package CMatching
### Keywords: causal inference cluster

### ** Examples

# a paper and pencil example with a few units

id  <- c(1,2,3,4,5, 6,7,8,9,10)
 x  <- c( 1,1,1.1,1.1,1.4, 2,1,1,1.3, 1.3 )
 t  <- c( 1,1,1,1,0, 0,0,0,0, 0 )
 g  <- c(1,1,2,2,1,1,2,2,2, 2 ) # two groups of four and six units
toy <- t(data.frame(id,g, t,x))

# reorder units by ascending group
 toyord <-toy[,order(g)] 
 x <-toyord["x",]
 t <-toyord["t",]
 g <- toyord["g",]

# pooled matching
pm <- Match(Y=NULL, Tr=t, X=x, caliper=2,ties=FALSE,replace=FALSE)
# within matching 
wm <- CMatch(type="within",Y=NULL, Tr=t, X=x, Group=g,caliper=2,ties=FALSE,replace=FALSE)
# preferential-within matching
pwm <- CMatch(type="pwithin",Y=NULL, Tr=t, X=x, Group=g, caliper=2,ties=FALSE,replace=FALSE)
 
# quick look at matched dataset (matched pairs are vertically aligned)
# pooled
pm$index.treated
pm$index.control
# within
wm$index.treated
wm$index.control
# pref within
pwm$index.treated
pwm$index.control
 


