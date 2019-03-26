library(hbm)


### Name: communicability
### Title: Compute Communicability between Nodes in an HBM
### Aliases: communicability

### ** Examples

set.seed(2)
n = 100 # chain size
conf = generate.random.conf(n, scale = FALSE)

# compute the HBM
hm.control = hbm(exp(-1*as.matrix(dist(conf))), 2)$hm

# compute scale communicability
comm = communicability(hm.control)

# explore for position 50
plot(1:n, comm[50,], xlab = "Position", ylab = "Communicability", 
main = "Communicability for Position 50", pch=16)

# plot in original configuration
cols = rep("black", n)
cols[which(comm[50,] > 100)] = "blue"
plot(conf, xlab = "X", ylab = "Y", type = "n")
text(conf, labels = 1:n, col = cols)




