library(factoextra)


### Name: get_ca
### Title: Extract the results for rows/columns - CA
### Aliases: get_ca get_ca_col get_ca_row

### ** Examples

## No test: 
# Install and load FactoMineR to compute CA
# install.packages("FactoMineR")
 library("FactoMineR")
 data("housetasks")
 res.ca <- CA(housetasks, graph = FALSE)
 
# Result for column variables
 col <- get_ca_col(res.ca)
 col # print
 head(col$coord) # column coordinates
 head(col$cos2) # column cos2
 head(col$contrib) # column contributions
 
# Result for row variables
 row <- get_ca_row(res.ca)
 row # print
 head(row$coord) # row coordinates
 head(row$cos2) # row cos2
 head(row$contrib) # row contributions
 
 # You can also use the function get_ca()
 get_ca(res.ca, "row") # Results for rows
 get_ca(res.ca, "col") # Results for columns
 
## End(No test)



