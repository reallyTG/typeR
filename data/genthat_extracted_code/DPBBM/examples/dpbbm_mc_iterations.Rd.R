library(DPBBM)


### Name: dpbbm_mc_iterations
### Title: dpbbm_mc_iterations
### Aliases: dpbbm_mc_iterations
### Keywords: statistical Inference

### ** Examples

# generate a simulated dataset
set.seed(123455)
S <- 4
G <- 100
K <- 3
nb_mu <- 100
nb_size <- 0.8
prob <- c(1,1,1)
mat <- bbm_data_generate(S=S,G=G,K=K,prob=prob,alpha_band=c(2,6),beta_band=c(2,6),
                     nb_mu=nb_mu,nb_size=nb_size, plotf = FALSE, max_cor=0.5) 
# check generated data
id <- order(mat$gamma);
c <- mat$gamma[id]
mat_ratio <- (mat$k+1)/(mat$n+1);
heatmap(mat_ratio[id,], Rowv = NA, Colv = NA, scale="none", RowSideColors=as.character(c), 
        xlab = "4 samples", ylab="100 RNA methylation sites")

## Run the DPBBM result. This step takes a really long time.
## You are suggested to check the pre-prepared example for a quick start
F=system.file("extdata", "DPBBM_example.html", package="DPBBM")
browseURL(url=F)

## Alternatively
# cluster_label <- dpbbm_mc_iterations(mat$k, mat$n)
# # Show the clustering result. 
# table(cluster_label)
# pie(table(mat$gamma))
# 
# # Compare the clustering result with the true clustering IDs.
# id <- order(mat$gamma);
# c <- cluster_label
# r <- rainbow(3, start = 0, end = 0.3)
# mat_ratio <- (mat$k+1)/(mat$n+1);
# heatmap(mat_ratio[id,], Rowv = NA, Colv = NA, scale="none",
#         RowSideColors = as.character(cluster_label[id]), 
#         margins = c(3,25))



