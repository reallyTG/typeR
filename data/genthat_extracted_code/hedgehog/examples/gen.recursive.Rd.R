library(hedgehog)


### Name: gen.recursive
### Title: Build recursive structures in a way that guarantees termination.
### Aliases: gen.recursive

### ** Examples

# Generating a tree with integer leaves
treeGen <-
  gen.recursive(
    # The non-recursive cases
    list(
      gen.int(100)
    )
  , # The recursive cases
    list(
      gen.list( treeGen )
    )
  )



