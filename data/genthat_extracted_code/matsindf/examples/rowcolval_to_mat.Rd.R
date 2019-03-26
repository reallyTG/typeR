library(matsindf)


### Name: rowcolval_to_mat
### Title: Collapse a tidy data frame into a matrix with named rows and
###   columns
### Aliases: rowcolval_to_mat

### ** Examples

library(matsbyname)
library(dplyr)
data <- data.frame(Country  = c("GH", "GH", "GH"),
                   rows = c( "c 1",  "c 1", "c 2"),
                   cols = c( "i 1",  "i 2", "i 2"),
                   vals = c(   11  ,   12,    22 ))
A <- rowcolval_to_mat(data, rownames = "rows", colnames = "cols", matvals = "vals")
A
rowtype(A) # NULL, because types not set
coltype(A) # NULL, because types not set
B <- rowcolval_to_mat(data, rownames = "rows", colnames = "cols", matvals = "vals",
                            rowtypes  = "Commodities", coltypes  = "Industries")
B
C <- data %>% bind_cols(data.frame(rt = c("Commodities", "Commodities", "Commodities"),
                                   ct = c("Industries", "Industries", "Industries"))) %>%
  rowcolval_to_mat(rownames = "rows", colnames = "cols", matvals = "vals",
                   rowtypes = "rt", coltypes = "ct")
C
# Also works for single values if both the rownames and colnames columns contain NA
data2 <- data.frame(Country = c("GH"), rows = c(NA), cols = c(NA),
  rowtypes = c(NA), coltypes = c(NA), vals = c(2))
data2 %>% rowcolval_to_mat(rownames = "rows", colnames = "cols", matvals = "vals",
  rowtypes = "rowtypes", coltypes = "coltypes")
data3 <- data.frame(Country = c("GH"), rows = c(NA), cols = c(NA), vals = c(2))
data3 %>% rowcolval_to_mat(rownames = "rows", colnames = "cols", matvals = "vals")
# Fails when rowtypes or coltypes not all same. In data3, column rt is not all same.
data4 <- data %>% bind_cols(data.frame(rt = c("Commodities", "Industries", "Commodities"),
                                       ct = c("Industries", "Industries", "Industries")))
## Not run: 
##D rowcolval_to_mat(data4, rownames = "rows", colnames = "cols",
##D                           matvals = "vals", rowtypes = "rt", coltypes = "ct")
## End(Not run)



