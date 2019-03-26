library(HAC)


### Name: hac
### Title: Construction of 'hac' objects
### Aliases: hac hac.full print.hac hac2nacopula nacopula2hac

### ** Examples

# it might be helpful to plot the hac objects
# Example 1: 4-dim AC
tree = list("X1", "X2", "X3", "X4", 2)
AC = hac(type = 1, tree = tree)

# Example 2: 4-dim HAC
y = c("X1", "X4", "X3", "X2")
theta = c(2, 3, 4)

HAC1 = hac.full(type = 1, y = y, theta = theta)
HAC2 = hac(type = 1, tree = list(list(list("X2", "X3", 4), 
"X4", 3), "X1", 2))
tree2str(HAC1) == tree2str(HAC2) # [1] TRUE

# Example 3: 9-dim HAC

HAC = hac(type = 1, tree = list("X6", "X5", list("X2", "X4", "X3", 4.4),
list("X1", "X7", 3.3), list("X8", "X9", 4), 2.3))
plot(HAC)



