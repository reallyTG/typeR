## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
set.seed(100000)

## ----Install and Load----------------------------------------------------
# install.packages("SparseMDC")
library("SparseMDC")

## ----Biase  overview-----------------------------------------------------
# Load Dataset
data(data_biase)
# Summarize condition vector 
summary(as.factor(condition_biase))
# Compare condition and cell type
table(condition_biase, cell_type_biase)


## ----biase formatting----------------------------------------------------
# Check rows are genes and columns are cells 
head(data_biase[,1:5])
# Separate data by condition
biase_A <- data_biase[,which(condition_biase == "A")]
cell_type_A <- cell_type_biase[which(condition_biase == "A")]
biase_B <- data_biase[,which(condition_biase == "B")]
cell_type_B <- cell_type_biase[which(condition_biase == "B")]
biase_C <- data_biase[,which(condition_biase == "C")]
cell_type_C <- cell_type_biase[which(condition_biase == "C")]
# Move data into list
dat_l <- list(biase_A, biase_B, biase_C)


## ----normalize biase-----------------------------------------------------
pdat <- pre_proc_data(dat_l, dim = 3, norm = FALSE, log = TRUE, center = TRUE)

## ----check centering-----------------------------------------------------
# Check condition A
summary(rowSums(pdat[[1]]))
# Check condition B
summary(rowSums(pdat[[2]]))
# Check condition C
summary(rowSums(pdat[[3]]))

## ----lambda 1 estimation-------------------------------------------------
lambda1 <- lambda1_calculator(pdat, dim = 3, nclust = 3 )
lambda1

## ----lambda 2 estimation-------------------------------------------------
lambda2 <- lambda2 <- lambda2_calculator(pdat, dim = 3, nclust = 3, 
                                         lambda1 = lambda1)
lambda2

## ----sparsemdc app-------------------------------------------------------
# Apply SparseMDC
smdc_res <- sparse_mdc(pdat,  dim = 3, nclust = 3, lambda1 = lambda1, 
                      lambda2 = lambda2, nstarts = 50, init_iter = 1)

## ----examine clustering--------------------------------------------------
# Extract clustering solution
clusters <- smdc_res[[1]]
# Extract clusters for condition A
clusters_A <- clusters[[1]]
# Extract clusters for condition B
clusters_B <- clusters[[2]]
# Extract clusters for condition C
clusters_C <- clusters[[3]]
# Compare clusters and cell type 
table(cell_type_A, clusters_A)
table(cell_type_B, clusters_B)
table(cell_type_C, clusters_C)
# View full comparision
table(c(cell_type_A, cell_type_B, cell_type_C), 
      c(clusters_A, clusters_B, clusters_C))


## ----extract centers-----------------------------------------------------
# Extract centers
centers <- smdc_res[[2]]
# Extract centers for condition A
centers_A <- centers[[1]]
# Extract centers for condition B
centers_B <- centers[[2]]
# Extract centers for condition C
centers_C <- centers[[3]]

## ----housekeeping marker genes-------------------------------------------
#Identify housekeeping marker gene index
clus_1_hk_gene_ind <- which(centers_A[,1] == centers_B[,1] & 
                              centers_B[,1] == centers_C[,1] & 
                              centers_A[,1] != 0)
# Identify the housekeeping marker genes
clus_1_hk_genes <- row.names(data_biase)[clus_1_hk_gene_ind]

## ----Condition dependent-------------------------------------------------
clus_1_cd_gene_ind <- which(centers_A[,1] != 0 & centers_B[,1] != 0 & 
                              centers_A[,1] != centers_B[,1] |
                            centers_A[,1] != 0 & centers_C[,1] != 0 &
                              centers_A[,1] != centers_C[,1] |
                            centers_B[,1] != 0 & centers_C[,1] != 0 &
                              centers_B[,1] != centers_C[,1])

## ----Condition specific--------------------------------------------------
# Identify condition A specific genes
clus_1_A_cs_ind <- which(centers_A[,1] != 0 & centers_B[,1] == 0 & 
                           centers_C[,1] == 0)
clus_1_A_cs_genes <- row.names(data_biase)[clus_1_A_cs_ind]
# Identify condition B specific genes
clus_1_B_cs_ind <- which(centers_A[,1] == 0 & centers_B[,1] != 0 & 
                           centers_C[,1] == 0)
clus_1_B_cs_genes <- row.names(data_biase)[clus_1_B_cs_ind]
# Identify condition C specific genes
clus_1_C_cs_ind <- which(centers_A[,1] == 0 & centers_B[,1] == 0 & 
                           centers_C[,1] != 0)
clus_1_C_cs_genes <- row.names(data_biase)[clus_1_C_cs_ind]

