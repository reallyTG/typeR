library(hbm)


### Name: hierarchy
### Title: Compute Hierarchy of an HBM
### Aliases: hierarchy

### ** Examples

set.seed(2)

n = 100 # chain size
#generate configurations 
conf = generate.random.conf(n, sd = 0.5, scale = FALSE)
#perturb the chain
conf.perturb.all = generate.random.conf(n, perturb = 1:n, sd = 0.5, scale = FALSE)
# and again with less perturbration 
conf.perturb = generate.random.conf(n, perturb = 10:50, sd = 0.5, scale = FALSE)

# compute the HBMs
hm.control = hbm(exp(-1*as.matrix(dist(conf))), 2)$hm
hm.perturb.all = hbm(exp(-1*as.matrix(dist(conf.perturb.all))), 2)$hm
hm.perturb = hbm(exp(-1*as.matrix(dist(conf.perturb))), 2)$hm

h.control = hierarchy(hm.control)
h.perturb = hierarchy(hm.perturb)
h.perturb.all = hierarchy(hm.perturb.all)
h = c(h.control, h.perturb, h.perturb.all)

# plot
plot(1:3, h, pch = 19, cex = 2, axes = FALSE, ylab = "Chain Hierarchy", xlab = "Condition")
axis(1, at = 1:3, labels = c("Control", "Perturbed-Partial", "Perturbed-All"))
axis(2)





