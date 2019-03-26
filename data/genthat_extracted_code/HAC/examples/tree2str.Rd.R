library(HAC)


### Name: tree2str
### Title: String structure of HAC
### Aliases: tree2str

### ** Examples

# construct a hac object
tree = list(list("X1", "X5", "X2", 3), list("X3", "X4", "X6", 4), 2)
model = hac(type = 1, tree = tree)

# the parameters are returned within the curly brackets
# variables nested at the same node are separated by a dot

tree2str(model) # [1] "((X1.X5.X2)_{3}.(X3.X4.X6)_{4})_{2}"

# (X1.X5.X2)_{3} and (X3.X4.X6)_{4} are the two variables nested at the
# initial node with dependency parameter 2

tree2str(model, theta = FALSE) # [1] "((X1.X5.X2).(X3.X4.X6))"

# if theta = FALSE, only the structure of the variables is returned

# alternatively consider the following nested AC

tree = list("X1", list("X5", "X2", 3), list("X3", "X4", "X6", 4), 1.01)
model = hac(type = 1, tree = tree)

tree2str(model) # [1] "(X1.(X5.X2)_{3}.(X3.X4.X6)_{4})_{1.01}"

# _{1.01} represents the initial node
# the first three variables are given by the subtrees (X3.X4.X6)_{4},
# (X5.X2)_{3} and X1



