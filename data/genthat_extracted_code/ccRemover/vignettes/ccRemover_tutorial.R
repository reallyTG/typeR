## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(ccRemover)
set.seed(10)

## ----load data1----------------------------------------------------------
data(t.cell_data)

## ----data----------------------------------------------------------------
head(t.cell_data[,1:5])

## ----center check--------------------------------------------------------
summary(apply(t.cell_data,1, mean))

## ----Center the data-----------------------------------------------------
mean_gene_exp <- rowMeans(t.cell_data)
t_cell_data_cen <- t.cell_data - mean_gene_exp
summary(apply(t_cell_data_cen,1,mean))


## ----Extract Gene Names--------------------------------------------------
gene_names <- rownames(t_cell_data_cen)

## ----Identify cell-cycle genes-------------------------------------------
cell_cycle_gene_indices <- gene_indexer(gene_names, species = "mouse", 
                                        name_type = "symbols" )
length(cell_cycle_gene_indices)

## ----cell-cycle vector---------------------------------------------------
if_cc <- rep(FALSE,nrow(t_cell_data_cen)) 
if_cc[cell_cycle_gene_indices] <- TRUE
summary(if_cc)

## ----data list1----------------------------------------------------------
dat <- list(x=t_cell_data_cen, if_cc=if_cc)


## ----ccRemover-----------------------------------------------------------
xhat <- ccRemover(dat, bar=FALSE)


## ----add mean------------------------------------------------------------
xhat <- xhat + mean_gene_exp


## ----ccRemover with settings---------------------------------------------
xhat <- ccRemover(dat, cutoff = 3, max_it = 4, nboot = 200, ntop = 10, bar=FALSE)

