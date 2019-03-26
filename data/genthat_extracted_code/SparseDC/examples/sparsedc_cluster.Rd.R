library(SparseDC)


### Name: sparsedc_cluster
### Title: Sparse Differential Clustering
### Aliases: sparsedc_cluster

### ** Examples


set.seed(10)
# Select small dataset for example
data_test <- data_biase[1:100,]
# Split data into conditions 1 and 2
data_1 <- data_test[ , which(condition_biase == "A")]
data_2 <- data_test[ , which(condition_biase == "B")]
# Preprocess data (log transform and center)
pre_data <- pre_proc_data(data_1, data_2, norm = FALSE, log = TRUE,
center = TRUE)
# Calculate lambda 1 parameter
lambda1 <- lambda1_calculator(pdat1 = pre_data[[1]], pdat2 = pre_data[[2]],
 ncluster=3, alpha1 = 0.5, nboot1 = 1000)
# Calculate lambda 2 parameter
lambda2 <- lambda2_calculator(pdat1 = pre_data[[1]], pdat2 = pre_data[[2]],
 ncluster = 3, alpha2 = 0.5, nboot2 = 1000)
# Run sparse DC
sdc_res <- sparsedc_cluster(pdat1 = pre_data[[1]], pdat2 = pre_data[[2]], ncluster = 3,
lambda1 = lambda1, lambda2 = lambda2, nitter = 20, nstarts =50)
# Extract results
clusters_1 <- sdc_res$clusters1  # Clusters for condition 1 data
clusters_2 <- sdc_res$clusters2  # Clusters for condition 2 data
centers_1 <- sdc_res$centers1  # Centers for condition 1 data
centers_2 <- sdc_res$centers2  # Centers for condition 2 data
# View clusters
summary(as.factor(clusters_1))
summary(as.factor(clusters_2))
# View Marker genes
gene_names <- row.names(data_test)
m_gene_c1_up1 <- gene_names[which(centers_1[,1] > 0)]
m_gene_c1_up2 <- gene_names[which(centers_2[,1] > 0)]
m_gene_c1_down1 <- gene_names[which(centers_1[,1] < 0)]
m_gene_c1_down2 <- gene_names[which(centers_2[,1] < 0)]
m_gene_c2_cond <- gene_names[which(centers_1[,2] != centers_2[,2])]

# Can also run

pre_data <- pre_proc_data(data_1, data_2, norm = FALSE, log = TRUE,
center = TRUE)
pdata_A <- pre_data[[1]]
pdata_B <- pre_data[[2]]
lambda1 <- lambda1_calculator(pdat1 = pdata_A , pdat2 = pdata_B,
ncluster=3, alpha1 = 0.5, nboot1 = 1000)
lambda2 <- lambda2_calculator(pdat1 = pdata_A, pdat2 = pdata_B,
 ncluster = 3, alpha2 = 0.5, nboot2 = 1000)
# Run sparse DC
sdc_res <- sparsedc_cluster(pdat1 = pdata_A, pdat2 = pdata_B, ncluster = 3,
lambda1 = lambda1, lambda2 = lambda2, nitter = 20, nstarts =50)




