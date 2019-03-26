library(conf.design)


### Name: conf.set
### Title: Find all confounded effects
### Aliases: conf.set
### Keywords: design

### ** Examples

### If A B^2 C and B C D are confounded with blocks, then so are A C^2 D
### and A B D^2.

G <- rbind(c(A = 1, B = 2, C = 1, D = 0),
           c(A = 0, B = 1, C = 1, D = 1))
conf.set(G, 3)
###      A B C D
### [1,] 1 2 1 0
### [2,] 0 1 1 1
### [3,] 1 0 2 1
### [4,] 1 1 0 2

### Only three-factor interactions are confounded, so the design is
### presumably useful.

as.matrix(replications( ~ .^2, conf.design(G, 3)))
###          [,1]
### Blocks      9
### A          27
### B          27
### C          27
### D          27
### Blocks:A    3
### Blocks:B    3
### Blocks:C    3
### Blocks:D    3
### A:B         9
### A:C         9
### A:D         9
### B:C         9
### B:D         9
### C:D         9



