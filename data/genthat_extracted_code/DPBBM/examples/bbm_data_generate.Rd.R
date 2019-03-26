library(DPBBM)


### Name: bbm_data_generate
### Title: bbm_data_generate
### Aliases: bbm_data_generate
### Keywords: statistical Inference

### ** Examples

set.seed(123455)
S <- 4
G <- 100
K <- 3
nb_mu <- 100
nb_size <- 0.8
prob <- c(1,1,1)
mat <- bbm_data_generate(S=S,G=G,K=K,prob=prob,alpha_band=c(2,6),beta_band=c(2,6),
                         nb_mu=nb_mu,nb_size=nb_size, plotf = TRUE, max_cor=0.5) 
table(mat$gamma)
pie(mat$gamma)
id <- order(mat$gamma);
c <- mat$gamma[id]
mat_ratio <- (mat$k+1)/(mat$n+1);
heatmap(mat_ratio[id,], Rowv = NA, Colv = NA, scale="none", RowSideColors=as.character(c), 
        xlab = "4 samples", ylab="100 RNA methylation sites")



