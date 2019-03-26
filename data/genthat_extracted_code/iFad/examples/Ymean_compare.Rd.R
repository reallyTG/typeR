library(iFad)


### Name: Ymean_compare
### Title: Compare the infered Y_mean values with the true values
### Aliases: Ymean_compare

### ** Examples



library(Rlab)
library(MASS)
library(coda)
library(ROCR)

data(Y1_mean)
data(Y2_mean)
data(matrixY1)
data(matrixY2)
data(matrixZ_chain)
data(matrixW1)
data(matrixW2)
data(matrixW_chain)
data(matrixX)
data(matrixX_chain)
Ymean_compare(Y1_mean,Y2_mean,matrixY1, matrixY2, 
matrixZ_chain, matrixW1, matrixW2, matrixW_chain, 
matrixX, matrixX_chain, result_file_name="RMSE_demo.RData", 
plot_name="RMSE_plot.pdf")




