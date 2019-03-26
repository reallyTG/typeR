library(cregg)


### Name: cj_df
### Title: Create a "cj_df" data frame
### Aliases: cj_df cj_df.data.frame [.cj_df

### ** Examples

x1 <- data.frame(a = 1:3, b = 4:6)
attr(x1$a, "label") <- "Variable A"

# cj_df() returns a data frame
inherits(x1, "data.frame")
class(x1)

# attributes dropped for data frames
attr(x1[1:2,]$a, "label")

# attributes preserved with a cj_df
attr(cj_df(x1)[1:2,]$a, "label")




