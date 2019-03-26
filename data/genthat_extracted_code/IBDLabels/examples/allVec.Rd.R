library(IBDLabels)


### Name: State Vectors
### Title: IBD state vectors
### Aliases: allVec vec2label label2vec fgl2vec
### Keywords: Vec Vector

### ** Examples


## Vectors for all labels
allVec( ngam = 4 )

## Convert vector to label, with renumbering or without
vec2label( c(1,1,1,3))
vec2label( c(1,1,1,2)) 

## Convert label to vector
label2vec( 1, ngam = 4 )
label2vec( 2, ngam = 4 )
label2vec( 2, ngam = 6 ) 

## renumbering
fgl2vec( c(1,1,1,3) )
fgl2vec( c(5,1,5,6) ) 




