library(phenofit)


### Name: melt_list
### Title: melt_list
### Aliases: melt_list

### ** Examples

# data.frame
df <- data.frame(year = 2010, day = 1:3, month = 1, site = "A")
l  <- list(a = df, b = df)
df_new <- melt_list(l, "id")

# data.table
df <- data.table::data.table(year = 2010, day = 1:3, month = 1, site = "A")
l  <- list(a = df, b = df)
df_new <- melt_list(l, "id")



