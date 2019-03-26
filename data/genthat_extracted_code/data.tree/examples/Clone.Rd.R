library(data.tree)


### Name: Clone
### Title: Clone a tree (creates a deep copy)
### Aliases: Clone

### ** Examples

data(acme)
acmeClone <- Clone(acme)
acmeClone$name <- "New Acme"
# acmeClone does not point to the same reference object anymore:
acme$name

#cloning a subtree
data(acme)
itClone <- Clone(acme$IT)
itClone$isRoot





