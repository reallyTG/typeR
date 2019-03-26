library(tableMatrix)


### Name: merge.tableList
### Title: Merging tableList
### Aliases: merge.tableList merge.tableMatrix

### ** Examples


data(images8By8)

# Create tableMatrix from images8By8
TM <- tableMatrix(images8By8, c("direction","dimX","dimY"), 4:ncol(images8By8), c(8,8))

# Merge tableMatrix object with a data.frame
merge(TM, data.frame(direction="down", flag=TRUE), key="direction")




