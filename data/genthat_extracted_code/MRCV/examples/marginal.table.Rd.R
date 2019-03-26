library(MRCV)


### Name: marginal.table
### Title: Create a Marginal Table
### Aliases: marginal.table

### ** Examples

# Create a marginal table for 1 MRCV
farmer.mtable.one <- marginal.table(data = farmer1, I = 1, J = 5) 
farmer.mtable.one

# Create a marginal table for 2 MRCVs
farmer.mtable.two <- marginal.table(data = farmer2, I = 3, J = 4) 
farmer.mtable.two

# Create a marginal table for 3 MRCVs
farmer.mtable.three <- marginal.table(data = farmer3, I = 3, J = 4, K = 5) 
farmer.mtable.three



