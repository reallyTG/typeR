library(IBDLabels)


### Name: allJaq
### Title: Jacquard ordering
### Aliases: allJaq jaq2label label2jaq
### Keywords: Jaq Jacquard Phased Unphased

### ** Examples


## list all jacquard states
allJaq()

## Convert label to jacquard
label2jaq( 3, phased = TRUE )
label2jaq( 3, phased = FALSE )

## Convert jacquard to label
jaq2label( 9, phased = TRUE )
jaq2label( 9, phased = FALSE )




