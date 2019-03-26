library(cNORM)


### Name: rankByGroup
### Title: Determine the norm scores of the participants in each subsample
### Aliases: rankByGroup

### ** Examples

#Transformation with default parameters: RandIt and converting to T scores
data.elfe <- rankByGroup(elfe, group = "group")

#Transformation into Wechsler scores with Yu & Huang (2001) ranking procedure
data.elfe <- rankByGroup(elfe, group = "group", method = 7, scale=c(10, 3))




