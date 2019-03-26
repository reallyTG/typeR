library(Smisc)


### Name: list2df
### Title: Convert a list to a data frame
### Aliases: list2df

### ** Examples

# For a list of vectors
x <- c("r1c1 1", "r2c1 2", "r3c1 3", "r4c4 4")
y <- strsplit(x, "\ ")
y
list2df(y)
list2df(y, col.names = LETTERS[1:2])

# Here's another list of vectors
z <- list(NULL, a = c(first = 10, second = 12), NULL, b = c(first = 15, second = 17))
z
list2df(z)

# For a list of data frames
z <- list(d1 = data.frame(a = 1:4, b = letters[1:4]),
          d2 = data.frame(a = 5:6, b = letters[5:6]))
z
list2df(z)

# A list of lists
z <- list(list(a = 10, b = TRUE, c = "hi"), list(a = 12, b = FALSE, c = c("there", "bye")))
z
list2df(z)




