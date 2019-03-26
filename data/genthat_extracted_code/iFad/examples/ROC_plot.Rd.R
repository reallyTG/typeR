library(iFad)


### Name: ROC_plot
### Title: Calculate the AUC (area under curve) and generate ROC plot
### Aliases: ROC_plot

### ** Examples



library(Rlab)
library(MASS)
library(coda)
library(ROCR)


data(matrixZ1)
data(matrixZ2)
data(matrixZ_chain)
ROC_plot(matrixZ1, matrixZ2, matrixZ_chain, plot_name="ROC_plot.pdf", 
result_file_name="ROC_result.RData", burn=1)





