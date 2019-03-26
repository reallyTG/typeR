library(SplitSoftening)


### Name: softening.by.data.range
### Title: Make split softening based on data ranges.
### Aliases: softening.by.data.range

### ** Examples


if(require(tree)) {
  train.data <- iris[c(TRUE,FALSE),]
  test.data <- iris[c(FALSE,TRUE),]
  tr <- tree( Species~., train.data )
  
  # tree with "zero softening"
  s0 <- softsplits( tr )
  # softened tree
  s1 <- softening.by.data.range( s0, train.data, .5 )
  
  response0 <- predictSoftsplits( s0, test.data )
  response1 <- predictSoftsplits( s1, test.data )
  # get class with the highest response
  classification0 <- levels(train.data$Species)[apply( response0, 1, which.max )]
  classification1 <- levels(train.data$Species)[apply( response1, 1, which.max )]
  
  # compare classifiction to the labels
  table( classification0, test.data$Species )
  table( classification1, test.data$Species )
}





