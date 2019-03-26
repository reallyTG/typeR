library(hyperSpec)


### Name: rbind.fill.matrix
### Title: Bind matrices by row, and fill missing columns with NA
### Aliases: rbind.fill.matrix rbind.fill
### Keywords: manip

### ** Examples

 A <- matrix (1:4, 2)
 B <- matrix (6:11, 2)
 A
 B
 hyperSpec:::rbind.fill.matrix (A, B)

 colnames (A) <- c (3, 1)
 A
 hyperSpec:::rbind.fill.matrix (A, B)

 hyperSpec:::rbind.fill.matrix (A, 99)

#' rbind.fill(mtcars[c("mpg", "wt")], mtcars[c("wt", "cyl")])



