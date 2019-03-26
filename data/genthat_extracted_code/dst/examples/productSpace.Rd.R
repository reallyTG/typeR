library(dst)


### Name: productSpace
### Title: Product space representation of a relation
### Aliases: productSpace

### ** Examples

 ttfw= matrix(c(1,0,1,0,0,1,0,1,1,1,1,1),nrow=3,
  byrow = TRUE, 
  dimnames =list(NULL, c("foul", "fair", "foul", "fair")) )
 specfw = c(1,1,2) 
 infovarfw =matrix(c(5,7,2,2), ncol = 2, 
 dimnames = list(NULL, c("varnb", "size")) )
productSpace(tt=ttfw, specnb=specfw, infovar=infovarfw)



