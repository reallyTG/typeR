library(RClone)


### Name: genet_dist
### Title: Genetic distance
### Aliases: genet_dist genet_dist_sim genet_dist_core genet_dist_sim_core
###   graph_genet_dist
### Keywords: documentation

### ** Examples

data(posidonia)

res <- genet_dist(posidonia, manh = TRUE, graph = TRUE, alpha1 = 0.05)

#Combining functions:
res1 <- genet_dist(posidonia, manh = TRUE)$distance_matrix
res2 <- genet_dist_sim_core(posidonia, nbrepeat = 100, manh = TRUE, genet = TRUE)$distance_matrix

p1 <- hist(res1, freq = FALSE, col = rgb(0,0.4,1,1), breaks = seq(0, max(res1), 2))
p2 <- hist(res2, freq = FALSE, col = rgb(0.7,0.9,1,0.5), breaks = seq(0, max(res2), 2))

limx <- max(max(res1), max(res2))
plot(p1, col = rgb(0,0.4,1,1), freq = FALSE, xlim = c(0,limx))
plot(p2, col = rgb(0.7,0.9,1,0.5), freq = FALSE, add = TRUE)

#Other way:
p1 <- as.data.frame(table(res1))
p2 <- as.data.frame(table(res2))
barplot(p1$Freq/sum(p1$Freq), col=rgb(0,0.4,1,1), axis.lty = 1, 
names.arg = as.numeric(as.character(p1[,1])))
barplot(p2$Freq/sum(p2$Freq), col=rgb(0.7,0.9,1,0.5), add = TRUE)
title("Genetic distances between pairs of MLG")

#Adding a legend:
leg.txt <- c("original data","simulated data")
col <- c(rgb(0,0.4,1,1), rgb(0.7,0.9,1,0.5))
legend("topright", fill = col, leg.txt, plot = TRUE, bty = "o", box.lwd = 1.5, 
bg = "white")



