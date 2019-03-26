library(paws.common)


### Name: populate
### Title: Populate a list with data from another list
### Aliases: populate

### ** Examples

# Make an interface with metadata, e.g. type.
interface <- tag_add(list(foo = c(), bar = c()), list(type = "structure"))

# Combine data and the metadata from the interface.
populate(list(foo = 1, bar = 2), interface)




