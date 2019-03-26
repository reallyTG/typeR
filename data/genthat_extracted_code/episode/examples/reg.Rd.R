library(episode)


### Name: reg
### Title: Create 'reg' (regularisation) object
### Aliases: reg

### ** Examples

# Use 'reg' object to specify regularisation when creating 'ode' objects

# Example: power law kinetics with SCAD penalty on rate parameter
A <- matrix(
c(1, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 1, 0), ncol = 4, byrow = TRUE)
p <- plk(A, r = reg("scad"))

# Example: power law kinetics as above, with lower bound of -1
p <- plk(A, r = reg("scad", lower = -1))

# Example: rational mass action kinetics with
# MCP penalty on first parameter argument and l2 on second
B <- matrix(
c(0, 0, 1, 0,
  1, 1, 0, 0,
  1, 0, 0, 1), ncol = 4, byrow = TRUE)
rmak <- ratmak(A, B, r1 = reg("mcp"), r2 = reg("l2"))

# Example: mass action kinetics with
# no penalty on rate parameter and l2 on initial state
m <- mak(A, B, r = reg("none"), rx0 = reg("l2"))




