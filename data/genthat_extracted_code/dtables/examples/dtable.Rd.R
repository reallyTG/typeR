library(dtables)


### Name: dtable
### Title: Generate descriptive frequencies and statistics tables
### Aliases: dtable

### ** Examples

# Analyze all data
dtable(iris2)

#Analyze two or more variables
dtable(iris2, vars = c("Color", "Sold", "LikelyToBuy"))

# Analyze a single variable
dtable(iris2, vars = "Color")

# Return raw output
dtable(iris2, neat = FALSE)

# Return list output
dtable(iris2, as.list = TRUE)

# Frequencies sorted by size
dtable(iris2, sizesort = TRUE)




