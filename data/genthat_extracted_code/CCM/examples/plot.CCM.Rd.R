library(CCM)


### Name: plot.CCM
### Title: Plot CCM correlations
### Aliases: plot.CCM
### Keywords: hplot methods

### ** Examples

     ## load data ##
     data(data.expr)
     data(data.gender)
     
     ## split dataset into training / testing ##
     train.expr = data.expr[,1:20]
     test.expr = data.expr[,21:40]
     train.gender = data.gender[1:20]
     test.gender = data.gender[21:40]
     
     ## CCM using spearman correlation ##
     K = create.CCM(test.expr, train.expr, method = "spearman")
     
     ## plot correlations for the 3rd observation ##
     plot(K, train.gender, index = 3, main = "correlations for obs #3", 
	       xlab = "gender", ylab = "correlation") 




