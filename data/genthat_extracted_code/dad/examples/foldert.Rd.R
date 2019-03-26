library(dad)


### Name: foldert
### Title: Folder of data sets among time
### Aliases: foldert

### ** Examples

x <- data.frame(xyz = rep(c("A", "B", "C"), each = 2),
                xy = letters[1:6],
                x1 = rnorm(6),
                x2 = rnorm(6, 2, 1),
                row.names = paste0("i", 1:6))
y <- data.frame(xyz = c("A", "A", "B", "C"),
                xy = c("a", "b", "a", "c"),
                y1 = rnorm(4, 4, 2),
                row.names = c(paste0("i", c(1, 2, 4, 6))))
z <- data.frame(xyz = c("A", "B", "C"),
                z1 = rnorm(3),
                row.names = c("i1", "i2", "i5"))

# Columns selected by the user
ftc. <- foldert(x, y, z, cols.select = c("xyz", "x1", "y1", "z1"))
print(ftc.)

# cols.select = "union": all the variables (columns) of each data frame are kept
ftcun <- foldert(x, y, z, cols.select = "union")
print(ftcun)

# cols.select = "intersect": only variables common to all data frames
ftcint <- foldert(x, y, z, cols.select = "intersect")
print(ftcint)

# rows.select = "": the rows of the data frames are unchanged
# and the rownames are made unique
ftr. <- foldert(x, y, z, rows.select = "")
print(ftr.)

# rows.select = "union": all the individuals (rows) of each data frame are kept
ftrun <- foldert(x, y, z, rows.select = "union")
print(ftrun)

# rows.select = "intersect": only individuals common to all data frames
ftrint <- foldert(x, y, z, rows.select = "intersect")
print(ftrint)

# Define the times (times argument)
ftimes <- foldert(x, y, z, times = as.Date(c("2018-03-01", "2018-04-01", "2018-05-01")))
print(ftimes)



