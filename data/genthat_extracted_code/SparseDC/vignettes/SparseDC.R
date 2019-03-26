## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ------------------------------------------------------------------------
library(SparseDC)
set.seed(10)

## ------------------------------------------------------------------------
data(data_biase)
head(data_biase[,1:5])

## ------------------------------------------------------------------------
gene_names_biase <- row.names(data_biase)

## ------------------------------------------------------------------------
summary(as.factor(cell_type_biase))

## ------------------------------------------------------------------------
summary(as.factor(condition_biase))

## ------------------------------------------------------------------------
data_A <- data_biase[ , which(condition_biase == "A")]
data_B <- data_biase[ , which(condition_biase == "B")]

## ------------------------------------------------------------------------
dim(data_A)
dim(data_B)

## ------------------------------------------------------------------------
head(data_A[ ,1:5])

## ------------------------------------------------------------------------
head(data_B[ ,1:5])

## ------------------------------------------------------------------------
pre_data <- pre_proc_data(data_A, data_B, norm = FALSE, log = TRUE, center = TRUE)

## ------------------------------------------------------------------------
pdata_A <- pre_data[[1]]
pdata_B <- pre_data[[2]]

## ------------------------------------------------------------------------
head(pdata_A[,1:5])

## ------------------------------------------------------------------------
head(pdata_B[,1:5])

## ------------------------------------------------------------------------
summary(rowSums(cbind(pdata_A,pdata_B)))

## ------------------------------------------------------------------------
lambda1_value <- lambda1_calculator(pdata_A, pdata_B, ncluster = 3)
lambda1_value

## ------------------------------------------------------------------------
lambda2_value <- lambda2_calculator(pdata_A, pdata_B, ncluster =3)
lambda2_value

## ------------------------------------------------------------------------
sdc_res <- sparsedc_cluster(pdata_A, pdata_B, ncluster = 3, 
                              lambda1 = lambda1_value, lambda2 = lambda2_value)

## ------------------------------------------------------------------------

clusters_1 <- sdc_res$clusters1  # Clusters for condition 1 data
clusters_2 <- sdc_res$clusters2  # Clusters for condition 2 data
centers_1 <- sdc_res$centers1  # Centers for condition 1 data
centers_2 <- sdc_res$centers2  # Centers for condition 2 data

## ------------------------------------------------------------------------
summary(as.factor(clusters_1))

## ------------------------------------------------------------------------
summary(as.factor(clusters_2))

## ------------------------------------------------------------------------
table(cell_type_biase[which(condition_biase == "A")], clusters_1)

## ------------------------------------------------------------------------
table(cell_type_biase[which(condition_biase == "B")], clusters_2)

## ------------------------------------------------------------------------
table(c(cell_type_biase),c(clusters_1,clusters_2))

## ------------------------------------------------------------------------
zygote_top_10_index <- which(centers_1[,1] >= tail(sort(centers_1[,1]),10)[1])
zygote_top_10 <- gene_names_biase[zygote_top_10_index]
zygote_top_10

## ------------------------------------------------------------------------
zyg_t10_res <- cbind(zygote_top_10, centers_1[zygote_top_10_index])
zyg_t10_res

## ------------------------------------------------------------------------
diff_gene_index_2cell <- which(centers_1[,2] != centers_2[,2])
diff_gene_index_2cell

## ------------------------------------------------------------------------
#gap_stat <- sparsedc_gap(pdata_A, pdata_B,
#                                 min_clus = 2, max_clus=4,
#                                 nboots = 200, nitter = 20, nstarts = 10)
#plot(gap_stat$gap_stat, xlab = "Cluster Number", ylab = "Gap Statistic",
#     main = "Gap Statistic Plot")
#arrows(1:length(gap_stat$gap_stat),gap_stat$gap_stat-gap_stat$gap_se,
#       1:length(gap_stat$gap_stat),gap_stat$gap_stat+gap_stat$gap_se, 
#       code=3, length=0.02, angle = 90)

