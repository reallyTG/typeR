library(pracma)


### Name: str2num
### Title: Converting string to number (Matlab style)
### Aliases: str2num num2str
### Keywords: manip

### ** Examples

str1 <- " [1 2 3; 4, 5, 6; 7,8,9]  "
str2num(str1)
# matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)

# str2 <- " [1 2 3; 45, 6; 7,8,9]  "
# str2num(str2)
# Error in str2num(str2) : 
#   All rows in Argument 's' must have the same length.

A <- matrix(c(pi, 0, exp(1), 1), 2, 2)
B <- num2str(A, 2); b <- dim(B)
B <- as.numeric(B); dim(B) <- b
B
#      [,1] [,2]
# [1,] 3.14 2.72
# [2,] 0.00 1.00



