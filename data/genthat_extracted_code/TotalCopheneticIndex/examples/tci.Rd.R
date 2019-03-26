library(TotalCopheneticIndex)


### Name: tci
### Title: Total Cophenetic Index
### Aliases: tci

### ** Examples

  tree12 <- ape::read.tree(text='(1, (2, (3, (4, 5))));')  #Fig. 4, tree 12
  tci(tree12) # 10
  tree8  <- ape::read.tree(text='((1, 2, 3, 4), 5);')      #Fig. 4, tree 8
  tci(tree8)  # 6



