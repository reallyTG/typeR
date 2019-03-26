library(algstat)


### Name: Emaker
### Title: Create the expected higher-order statistics calculating matrix
###   for approval data
### Aliases: Emaker

### ** Examples

Emaker(6, 0, 1)
Emaker(6, 0, 2)
Emaker(6, 0, 3)
Emaker(6, 0, 4)

Emaker(6, 1, 1)
Emaker(6, 1, 2)
Emaker(6, 1, 3)
Emaker(6, 1, 4)
Emaker(6, 1, 5)
Emaker(6, 1, 6)

# compare to Tmaker
Emaker(6, 1, 3) # contributors when bumping up from 1-groups to 3-groups
Tmaker(6, 3, 1)



