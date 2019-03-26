library(ramify)


### Name: mat
### Title: Matrices
### Aliases: mat mat.character mat.default mat.list

### ** Examples

# Creating a matrix from a character string
mat("1, 2, 3, 4; 5, 6, 7, 8")  # ";" separates rows
mat("1, 2, 3, 4; 5, 6, 7, 8", rows = FALSE)  # ";" separates columns
mat("1 2 3 4; 5 6 7 8", sep = "")  # use spaces instead of commas
mat(c(1, 2, 3, 4, 5, 6, 7, 8), nrow = 2, byrow = TRUE)  # works like matrix too

# Character strings containing R expressions
mat("rnorm(3); rnorm(3)")
mat("rnorm(3); rnorm(3)", eval = TRUE)
mat("1, 2, 3; 4, 5, pi")
mat("1, 2, 3; 4, 5, pi", eval = TRUE)

# Creating a matrix from a list
z1 <- list(1:5, 6:10)
z2 <- list(a = 1:5, b = 6:10)
mat(z1)
mat(z2)  # preserves names as row names
mat(z2, rows = FALSE)  # preserves names as column names



