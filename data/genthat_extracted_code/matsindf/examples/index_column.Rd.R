library(matsindf)


### Name: index_column
### Title: Index a column in a data frame by groups relative to an initial
###   year
### Aliases: index_column

### ** Examples

library(dplyr)
library(tidyr)
DF <- data.frame(Year = c(2000, 2005, 2010), a = c(10, 15, 20), b = c(5, 5.5, 6)) %>%
  gather(key = name, value = var, a, b) %>%
  group_by(name)
index_column(DF, var_to_index = "var", time_var = "Year", suffix = "_ratioed")
index_column(DF, var_to_index = "var", time_var = "Year", indexed_var = "now.indexed")
index_column(DF, var_to_index = "var", time_var = "Year", index_time = 2005,
          indexed_var = "now.indexed")
## Not run: 
##D   DF %>%
##D     ungroup() %>%
##D     group_by(name, var) %>%
##D     index_column(var_to_index = "var", time_var = "Year") # Fails! Do not group on var_to_index.
##D   DF %>%
##D     ungroup() %>%
##D     group_by(name, Year) %>%
##D     index_column(var_to_index = "var", time_var = "Year") # Fails! Do not group on time_var.
## End(Not run)



