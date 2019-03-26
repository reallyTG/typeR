## ----setup, echo=FALSE---------------------------------------------------
knitr::opts_chunk$set(
	message = FALSE,
	warning = FALSE,
	collapse = TRUE,
	comment = "#>",
	fig.align = "center",
	fig.width = 6,
	fig.height = 4.5
)

## ----install_CRAN, message=FALSE, eval=FALSE-----------------------------
#  install.packages("diceR")

## ----install_github, message=FALSE, eval=FALSE---------------------------
#  # install.packages("devtools")
#  devtools::install_github("AlineTalhouk/diceR")

## ----load----------------------------------------------------------------
library(diceR)
library(dplyr)
library(ggplot2)
library(pander)
data(hgsc)
hgsc <- hgsc[1:100, 1:50]

## ----consensus_cluster, results='hide'-----------------------------------
CC <- consensus_cluster(hgsc, nk = 3:4, p.item = 0.8, reps = 5,
                        algorithms = c("hc", "pam", "diana"))

## ----consensus_cluster_str-----------------------------------------------
co <- capture.output(str(CC))
strwrap(co, width = 80)

## ----consensus_cluster_table, echo=FALSE, results='asis'-----------------
pandoc.table(head(CC[, , "DIANA_Euclidean", "3"]),
             caption = "Cluster Assignments for DIANA, k = 3")

## ----impute_knn----------------------------------------------------------
CC <- apply(CC, 2:4, impute_knn, data = hgsc, seed = 1)
CC_imputed <- impute_missing(CC, hgsc, nk = 4)
sum(is.na(CC))
sum(is.na(CC_imputed))

## ----consensus_matrix----------------------------------------------------
pam.4 <- CC[, , "PAM_Euclidean", "4", drop = FALSE]
cm <- consensus_matrix(pam.4)
dim(cm)

## ----graph_heatmap-------------------------------------------------------
hm <- graph_heatmap(pam.4)

## ----consensus_combine, results='hide'-----------------------------------
ccomb_matrix <- consensus_combine(CC, element = "matrix")
ccomb_class <- consensus_combine(CC, element = "class")

## ----consensus_combine_str-----------------------------------------------
str(ccomb_matrix, max.level = 2)

## ----consensus_combine_table, echo=FALSE, results='asis'-----------------
pandoc.table(head(ccomb_class$`4`), caption = "Consensus Classes")

## ----consensus_matrix_ccomb_class----------------------------------------
# consensus matrix across subsamples and algorithms within k = 3
cm_k3 <- consensus_matrix(ccomb_class$`3`)

# consensus matrix across subsamples and algorithms within k = 4
cm_k4 <- consensus_matrix(ccomb_class$`4`)

# consensus matrix across subsamples and algorithms and k
cm_all <- consensus_matrix(ccomb_class)

## ----consensus_combine_2_str, results='hide'-----------------------------
CC2 <- consensus_cluster(hgsc, nk = 3:4, p.item = 0.8, reps = 5,
                         algorithms = "km")
ccomb_class2 <- consensus_combine(CC, CC2, element = "class")

## ----consensus_combine_2_table, echo=FALSE, results='asis'---------------
pandoc.table(head(ccomb_class2$`4`), caption = "Consensus Classes with KM added")

## ----consensus_evaluate, results='hide'----------------------------------
ccomp <- consensus_evaluate(hgsc, CC, CC2, plot = FALSE)

## ----consensus_evaluate_table, echo=FALSE, results='asis'----------------
pandoc.table(ccomp$ii$`4`, split.tables = 100,
             caption = "Internal Indices for k = 4")

## ----consensus_evaluate_trim, results='hide'-----------------------------
ctrim <- consensus_evaluate(hgsc, CC, CC2, trim = TRUE, reweigh = FALSE, n = 2)

## ----consensus_evaluate_trim_str-----------------------------------------
str(ctrim, max.level = 2)

## ----sigclust------------------------------------------------------------
set.seed(1)
pam_4 <- ccomb_class2$`4`[, "PAM_Euclidean"]
sig_obj <- sigclust(hgsc, k = 4, nsim = 100, labflag = 0, label = pam_4)
co <- capture.output(str(sig_obj))
strwrap(co, width = 80)

