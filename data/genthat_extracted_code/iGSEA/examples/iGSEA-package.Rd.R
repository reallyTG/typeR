library(iGSEA)


### Name: iGSEA-package
### Title: Integrative GSEA Approaches
### Aliases: igsea.test iGSEA
### Keywords: GSEA meta-analysis adaptive testing

### ** Examples

#Set seed to make sure the permutaiton test gives the same results
set.seed(1234)

#In the following binray example, there are 200 genes in total.
#Genes 1-40 are set to be up-regulated genes as their gene expression levels are 
#associated with phenotypes.
#The remaining 160 genes are equally expressed genes.
#Gene set 1, which contains 40% up-regulated genes, is enriched. 
#Gene set 2, which contains 20% up-regulated genes, is not enriched.
#As there are no RE genes, FE and AT should perform well.
G <- matrix(rnorm(200 * 60), c(200, 60))                 #200 genes and 60 samples in total
P <- c(rep(c(rep(1, 5), rep(0, 5)), 2), rep(c(rep(1, 10), rep(0, 10)), 2))      #phenotypes
G[1:40, c(1:5, 11:15, 21:30, 41:50)] <- G[1:40, c(1:5, 11:15, 21:30, 41:50)] + 0.45   
S <- c(10, 10, 20, 20)                                 #the number of samples in each study
I <- matrix(rep(1, 200*4), 200)                        #all genes are included in 4 studies
GS <- matrix(0, 200, 2)
GS[c(1:20, 151:180), 1] <- 1                                        #gene set 1 is enriched
GS[c(31, 80), 2] <- 1                                           #gene set 2 is non-enriched
igsea.test(G, P, S, I, GS)    #the output vector consists of two Q-values for the gene sets

#A similar normal example is also provided below:
set.seed(1234)
G <- matrix(rnorm(200 * 60), c(200, 60))                 #200 genes and 60 samples in total
P <- rnorm(60)                                                                  #phenotypes
S <- c(10, 10, 20, 20)                                 #the number of samples in each study
rho_raw <- matrix(0, 200, 4)
for (i in 1:40) rho_raw[i, ] <- rnorm(4, mean = 0.3, sd = 0.1)
beta <- matrix(0, 200, 60) 
for (i in 1:200) beta[i, ] <- beta[i, ] + c(rep(rho_raw[i, 1], 10), rep(rho_raw[i, 2], 10),
rep(rho_raw[i, 3], 20), rep(rho_raw[i, 4], 20))
for (i in 1:200) {
  for (j in 1:60){
    G[i, j] <- rnorm(1, mean = beta[i, j] * P[j], sd = sqrt(1 - beta[i, j] ^ 2))
  }
}                                     
I <- matrix(rep(1, 200*4), 200)                        #all genes are included in 4 studies
GS <- matrix(0, 200, 2)
GS[c(1:20, 151:180), 1] <- 1                                        #gene set 1 is enriched
GS[c(31, 80), 2] <- 1                                           #gene set 2 is non-enriched
igsea.test(G, P, S, I, GS, vtype = "continuous") 



