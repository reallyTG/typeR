library(IBDLabels)


### Name: IBDLabel
### Title: Convert between different IBD-state labelling schemes
### Aliases: IBDLabel-package IBDLabel
### Keywords: package

### ** Examples


## For more examples see

vignette( "IBDlabels_tutorial" )

######### All States ######################

## create lookup matrix
allStates( ngam = 4 )
allStates( ngam = 5 )

######### Jacquard Ordering ###############

## list all jacquard states
allJaq()

## Convert label to jacquard
label2jaq( 3, phased = TRUE )
label2jaq( 3, phased = FALSE )

## Convert jacquard to label
jaq2label( 9, phased = TRUE )
jaq2label( 9, phased = FALSE )

######## Lexicographic Ordering ###########

## Vector of all lexicograghic states with labels ( names of elements )
allLex( ngam = 4 )

## Convert lex to label
lex2label( lex = c( 1, 2, 15), ngam = 4 )

## Convert label to lex
## Some labels go to the same lex state
label2lex( label = c( 2, 3 ), ngam = 4 ) 

######## Vector Notation ##################

## Vectors for all labels
allVec( ngam = 4 )

## Convert vector to label, with renumbering 
vec2label( c(1,1,1,3))
vec2label( c(1,1,1,2)) 

## Convert label to vector
label2vec( 1, ngam = 4 )
label2vec( 2, ngam = 4 )
label2vec( 2, ngam = 6 ) 

## renumbering
fgl2vec( c( 1,1,1,3) )
fgl2vec( c(5,1,5,6) )




