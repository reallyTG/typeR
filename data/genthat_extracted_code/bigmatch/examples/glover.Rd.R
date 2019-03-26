library(bigmatch)


### Name: glover
### Title: Perfect matching in a convex bipartite graph.
### Aliases: glover

### ** Examples

# A perfect matching exists, and glover produces one.
left<-c(2,1,1,4,5)
right<-c(4,3,1,5,5)
glover(left,right)

# No perfect matching exists, and glover returns maximum matching ratio.
# Treated 4 and treated 5 can only be matched to control 5.

left<-c(2,1,1,5,5)
right<-c(4,3,1,5,5)
glover(left,right)



