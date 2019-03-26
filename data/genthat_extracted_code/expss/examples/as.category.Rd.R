library(expss)


### Name: as.category
### Title: Convert dichotomy data.frame/matrix to data.frame with category
###   encoding
### Aliases: as.category is.category

### ** Examples

set.seed(123)

# Let's imagine it's matrix of consumed products
dichotomy_matrix = matrix(sample(0:1,40,replace = TRUE,prob=c(.6,.4)),nrow=10)
colnames(dichotomy_matrix) = c("Milk","Sugar","Tea","Coffee")

as.category(dichotomy_matrix, compress = TRUE) # compressed version
category_encoding = as.category(dichotomy_matrix)

 # should be TRUE
identical(val_lab(category_encoding), c(Milk = 1L, Sugar = 2L, Tea = 3L, Coffee = 4L))
all(as.dichotomy(category_encoding, use_na = FALSE) == dichotomy_matrix)

# with prefix
as.category(dichotomy_matrix, prefix = "products_")

# data.frame with variable labels
dichotomy_dataframe = as.data.frame(dichotomy_matrix)
colnames(dichotomy_dataframe) = paste0("product_", 1:4)
var_lab(dichotomy_dataframe[[1]]) = "Milk"
var_lab(dichotomy_dataframe[[2]]) = "Sugar"
var_lab(dichotomy_dataframe[[3]]) = "Tea"
var_lab(dichotomy_dataframe[[4]]) = "Coffee"

as.category(dichotomy_dataframe, prefix = "products_")




