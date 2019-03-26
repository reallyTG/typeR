library(Oncotree)


### Name: generate.data
### Title: Generate random data from an oncogenetic tree
### Aliases: generate.data
### Keywords: datagen models

### ** Examples

   data(ov.cgh)
   ov.tree <- oncotree.fit(ov.cgh)
   
   set.seed(7365)
   rd <- generate.data(200, ov.tree, with.errors=TRUE)
   
   #compare timing of methods
   system.time(generate.data(20, ov.tree, with.errors=TRUE, method="S"))
   system.time(generate.data(20, ov.tree, with.errors=TRUE, method="D1"))
   system.time(generate.data(20, ov.tree, with.errors=TRUE, method="D2"))




