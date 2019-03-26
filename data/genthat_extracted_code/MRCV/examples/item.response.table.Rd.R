library(MRCV)


### Name: item.response.table
### Title: Create an Item Response Table or Data Frame
### Aliases: item.response.table

### ** Examples

# Create an item response table for 1 SRCV and 1 MRCV
farmer.irtable.one <- item.response.table(data = farmer1, I = 1, J = 5) 
farmer.irtable.one

# Create an item response data frame for 1 SRCV and 1 MRCV
farmer.irdataframe.one <- item.response.table(data = farmer1, I = 1, J = 5, 
    create.dataframe = TRUE) 
farmer.irdataframe.one

# Create an item response table for 2 MRCVs
farmer.irtable.two <- item.response.table(data = farmer2, I = 3, J = 4) 
farmer.irtable.two

# Create an item response table for 3 MRCVs
farmer.irtable.three <- item.response.table(data = farmer3, I = 3, J = 4, K = 5) 
farmer.irtable.three



