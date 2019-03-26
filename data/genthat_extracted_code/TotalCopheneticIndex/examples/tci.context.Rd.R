library(TotalCopheneticIndex)


### Name: tci.context
### Title: Contextualize Total Cophenetic Index value
### Aliases: tci.context tci.context.n

### ** Examples

  tree12 <- ape::read.tree(text='(1, (2, (3, (4, 5))));')  #Fig. 4, tree 12
  tci(tree12)
  tci.context(tree12)
  tci.context.n(5) # For any tree with 5 tips



