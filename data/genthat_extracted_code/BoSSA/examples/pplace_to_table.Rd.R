library(BoSSA)


### Name: pplace_to_table
### Title: Merge the multiclass and the placement table of pplace object
### Aliases: pplace_to_table

### ** Examples


data(pplace)

### with every placement
pplace_to_table(pplace)

### keeping only the best placement for each sequence
pplace_to_table(pplace,type="best")



