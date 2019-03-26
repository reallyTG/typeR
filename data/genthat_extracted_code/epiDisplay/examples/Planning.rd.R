library(epiDisplay)


### Name: Data for cleaning
### Title: Dataset for practicing cleaning, labelling and recoding
### Aliases: Planning
### Keywords: datasets

### ** Examples

data(Planning)
des(Planning)

# Change var. name to lowercase
names(Planning) <- tolower(names(Planning)) 
.data <- Planning
des(.data)
# Check for duplication of 'id'
attach(.data)
any(duplicated(id))
duplicated(id)
id[duplicated(id)] #215

# Which one(s) are missing?
setdiff(min(id):max(id), id) # 216

# Correct the wrong on
id[duplicated(id)] <- 216
detach(.data)
rm(list=ls())



