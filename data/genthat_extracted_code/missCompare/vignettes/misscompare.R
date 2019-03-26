## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(missCompare)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("missCompare")
#  library(missCompare)

## ----eval = TRUE---------------------------------------------------------
data("clindata_miss")

## ----eval = TRUE---------------------------------------------------------
cleaned <- missCompare::clean(clindata_miss,
                              var_removal_threshold = 0.5, 
                              ind_removal_threshold = 0.8,
                              missingness_coding = -9)

## ----eval = TRUE---------------------------------------------------------
metadata <- missCompare::get_data(cleaned,
                                  matrixplot_sort = T,
                                  plot_transform = T)

## ----echo = FALSE, fig.width=6, fig.height=3-----------------------------
metadata$NA_Correlation_plot

## ----echo = FALSE, fig.width=6, fig.height=3-----------------------------
metadata$min_PDM_thresholds

## ----echo = FALSE, fig.width=6, fig.height=3-----------------------------
metadata$Matrix_plot

## ----echo = FALSE, fig.width=6, fig.height=3-----------------------------
metadata$Cluster_plot

## ----eval = FALSE--------------------------------------------------------
#  simulated <- missCompare::simulate(rownum = metadata$Rows,
#                                     colnum = metadata$Columns,
#                                     cormat = metadata$Corr_matrix,
#                                     meanval = 0,
#                                     sdval = 1)

## ----eval = FALSE--------------------------------------------------------
#  missCompare::MCAR(simulated$Simulated_matrix,
#               MD_pattern = metadata$MD_Pattern,
#               NA_fraction = metadata$Fraction_missingness,
#               min_PDM = 10)

## ----eval = FALSE--------------------------------------------------------
#  missCompare::MAR(simulated$Simulated_matrix,
#               MD_pattern = metadata$MD_Pattern,
#               NA_fraction = metadata$Fraction_missingness,
#               min_PDM = 10)
#  
#  missCompare::MNAR(simulated$Simulated_matrix,
#               MD_pattern = metadata$MD_Pattern,
#               NA_fraction = metadata$Fraction_missingness,
#               min_PDM = 10)

## ----eval = FALSE--------------------------------------------------------
#  missCompare::MAP(simulated$Simulated_matrix,
#               MD_pattern = metadata$MD_Pattern,
#               NA_fraction = metadata$Fraction_missingness,
#               min_PDM = 10,
#               assumed_pattern = c(rep("MCAR", 10), "MNAR"))

## ----eval = FALSE--------------------------------------------------------
#  missCompare::impute_simulated(rownum = metadata$Rows,
#                                colnum = metadata$Columns,
#                                cormat = metadata$Corr_matrix,
#                                MD_pattern = metadata$MD_Pattern,
#                                NA_fraction = metadata$Fraction_missingness,
#                                min_PDM = 10,
#                                n.iter = 50,
#                                assumed_pattern = NA)

## ----eval = FALSE--------------------------------------------------------
#  imputed <- missCompare::impute_data(clindata_miss,
#                           scale = F,
#                           n.iter = 10,
#                           sel_method = c(14)) # 14 is the code for missForest

## ----eval = TRUE, message = FALSE----------------------------------------
imputed <- missCompare::impute_data(cleaned, 
                         scale = T, 
                         n.iter = 10, 
                         sel_method = c(3)) # 3 is the code for mean imputation

## ----eval = TRUE, warning = FALSE----------------------------------------
diag <- missCompare::post_imp_diag(cleaned,
                                   imputed$mean_imputation[[1]], 
                                   scale=T, 
                                   n.boot = 5)

## ----echo = FALSE, fig.width=6, fig.height=3-----------------------------
diag$Histograms$SBP

## ----eval = TRUE, echo = FALSE, message=FALSE, warning = FALSE, results='hide'----
imputed <- missCompare::impute_data(cleaned, 
                         scale = T, 
                         n.iter = 1, 
                         sel_method = c(13)) # 13 is the code for Amelia II

diag <- missCompare::post_imp_diag(cleaned,
                                   imputed$ameliaII_imputation[[1]], 
                                   scale=T, 
                                   n.boot = 5)

## ----echo = FALSE, fig.width=6, fig.height=3-----------------------------
head(diag$Statistics, 2)

## ----echo = FALSE, fig.width=6, fig.height=3-----------------------------
diag$Correlation_plot

