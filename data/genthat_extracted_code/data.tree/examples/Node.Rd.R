library(data.tree)


### Name: Node
### Title: Create a 'data.tree' Structure With 'Nodes'
### Aliases: Node
### Keywords: datasets

### ** Examples

library(data.tree)
acme <- Node$new("Acme Inc.")
accounting <- acme$AddChild("Accounting")$
              AddSibling("Research")$
              AddChild("New Labs")$
              parent$
              AddSibling("IT")$
              AddChild("Outsource")
print(acme)




