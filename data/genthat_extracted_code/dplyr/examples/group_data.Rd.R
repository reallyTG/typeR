library(dplyr)


### Name: group_rows
### Title: Grouping data
### Aliases: group_rows group_data

### ** Examples

df <- tibble(x = c(1,1,2,2))

# one row
group_data(df)
group_rows(df)

# 2 rows, one for each group
group_by(df,x) %>% group_data()
group_by(df,x) %>% group_rows()




