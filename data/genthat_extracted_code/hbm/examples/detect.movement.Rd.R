library(hbm)


### Name: detect.movement
### Title: Detect Movements Between Association Matrices using their HBMs
### Aliases: detect.movement

### ** Examples

set.seed(2)
n = 200 # chain size

# control configuration
conf = generate.random.conf(n, sd = 0.5, scale = FALSE)
# condition-1
conf.tr.1 = conf
conf.tr.1[99,] = conf.tr.1[77,]-0.5

# generate contact map-like matrices
control = exp(-1*as.matrix(dist(conf))) 
tr.1 = exp(-1*as.matrix(dist(conf.tr.1))) 

control.res = hbm(control, 2)
tr.1.res = hbm(tr.1, 2)
m1 = detect.movement(control, tr.1, control.res, tr.1.res)
resm = get.movements(m1, control.res$hm)
resm

# compare with configuration
par(mfrow = c(1,2))
cols = rep("black", n)
cols[unique(resm$from)] = "green"
plot(conf, xlab = "X", ylab = "Y", type = 'n', main = "Control")
text(conf[,1:2], labels = 1:n, cex = 0.75, col = cols)
cols = rep("black", n)
cols[unique(resm$from)] = "green"
cols[resm$to[which(resm$type == 0.5)]] = "pink"
cols[resm$to[which(resm$type == 1)]] = "red"
cols[resm$to[which(resm$type == -0.5)]] = "cyan"
cols[resm$to[which(resm$type == -1)]] = "blue"
plot(conf.tr.1, xlab = "X", ylab = "Y", type = 'n', main = "Condition-1", col = cols)
text(conf.tr.1[,1:2], labels = 1:n, cex = 0.75, col = cols)







