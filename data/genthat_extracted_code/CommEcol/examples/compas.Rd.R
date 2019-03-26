library(CommEcol)


### Name: compas
### Title: Simulation of species community data along gradients
### Aliases: compas

### ** Examples

# 1 dimension.
coo <- seq(10, 90, 10)
compas(S=30, dims=1, am=2, beta=1, coords=coo, n.quali=0.3, add1=0.1)
	
	
# 2 dimensions.
coo2 <- cbind(coo, coo)
compas(S=30, dims=2, am=c(2,2), beta=c(2,2), coords=coo2, n.quali=0.3, add1=0.1)


# 2 dimensions. Homogeneous and clumped species distributions.
# Try a few times.
coo.grid <- expand.grid(seq(10,90,10), seq(10,90,10))
plot(coo.grid, xlim=c(0,100), ylim=c(0,100))

mat1 <- compas(S=60, dims=2, am=c(2,2), clump=1, 
               beta=c(2,2), coords=coo.grid, n.quali=0.3, add1=0.1)
S1 <- rowSums(ifelse(mat1>0,1,0))

mat2 <- compas(S=60, dims=2, am=c(2,2), clump=3, 
               beta=c(2,2), coords=coo.grid, n.quali=0.3, add1=0.1)
S2 <- rowSums(ifelse(mat2>0,1,0))

ind <- coo.grid/10
S1.mat <- matrix(NA, 9, 9)
S2.mat <- matrix(NA, 9, 9)
for(i in 1:length(S1)){
      S1.mat[ind[i,1], ind[i,2]] <- S1[i] 
      S2.mat[ind[i,1], ind[i,2]] <- S2[i] 
   }

plot(coo.grid, cex=S1/4)
plot(coo.grid, cex=S2/4)

image(x=coo, y=coo, z=S1.mat, col=gray(50:1/50))
image(x=coo, y=coo, z=S2.mat, col=gray(50:1/50))

filled.contour(x=coo, y=coo, z=S1.mat)
filled.contour(x=coo, y=coo, z=S2.mat)



