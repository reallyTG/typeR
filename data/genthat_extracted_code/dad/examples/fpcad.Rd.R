library(dad)


### Name: fpcad
### Title: Functional PCA of probability densities
### Aliases: fpcad

### ** Examples

data(roses)
# Case of a normed non-centred PCA of Gaussian densities (on 3 architectural 
# characteristics of roses: shape (Sha), foliage density (Den) and symmetry (Sym))
rosesf <- as.folder(roses[,c("Sha","Den","Sym","rose")])
result3 <- fpcad(rosesf, group.name = "rose")
print(result3)
plot(result3)

# Flower colors of the roses
scores <- result3$scores
scores <- data.frame(scores, color = scores$rose)
levels(scores$color) <- c(A = "yellow", B = "yellow", C = "pink", D = "yellow", E = "red",
                         F = "yellow", G = "pink", H = "pink", I = "yellow", J = "yellow")
# Scores according to the first two principal components, per color
plot(scores$PC.1, scores$PC.2, pch = 19, col = as.character(scores$color), cex = 1.5)



