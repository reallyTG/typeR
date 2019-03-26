library(ramify)


### Name: hcat
### Title: Concatenate Matrices
### Aliases: hcat vcat

### ** Examples

m1 <- mat("1, 2, 3; 4, 5, 6")
m2 <- mat("7, 8, 9; 10, 11, 12")
hcat(m1, m2)  # same as 'bmat("m1, m2")'
vcat(m1, m2)  # same as 'bmat("m1; m2")'



