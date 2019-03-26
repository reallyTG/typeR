library(OpasnetUtils)


### Name: Optimize
### Title: Simple optimization between discrete index locations
### Aliases: Optimize Minimize

### ** Examples

a <- Ovariable(output = data.frame(A = letters[c(1,1,2,2)], B = c(1,2,1,2), Result = 1:4))
Minimize(a, "B")
Minimize(a, "A")



