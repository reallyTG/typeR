library(phenofit)


### Name: reorder_name
### Title: reorder_name
### Aliases: reorder_name rm_empty contain

### ** Examples

df <- data.frame(year = 2010, day = 1:3, month = 1, site = "A")
dt <- data.table::data.table(year = 2010, day = 1:3, month = 1, site = "A")
l <- list(year = 2010, day = 1:3, month = 1, site = "A")

newname <- c("site", "year")
reorder_name(df, newname)
reorder_name(dt, newname)
reorder_name(l, newname)

# numeric
x <- c(1:5, NA)
rm_empty(x)

# list
l <- list(1:5, NULL, NA)
rm_empty(l)
df <- data.frame(year = 2010, day = 1:3, month = 1, site = "A")
contain(df, "year|month|day")



