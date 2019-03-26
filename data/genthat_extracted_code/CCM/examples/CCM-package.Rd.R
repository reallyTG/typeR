library(CCM)


### Name: CCM-package
### Title: Correlation classification method (CCM)
### Aliases: CCM-package CCM
### Keywords: package methods hplot

### ** Examples

     ## load data ##
     data(data.expr)
     data(data.gender)

     ## check within class correlations ##
     ## outliers may be caused by poor quality ##
     ## observations or may indicate CCM is not appropriate ##
     K = cor.by.class(data.expr, data.gender)
     ## visualize the results ##
     boxplot(K, xlab = "gender")
     
     ## split dataset into training / testing ##
     train.expr = data.expr[,1:20]
     test.expr = data.expr[,21:40]
     train.gender = data.gender[1:20]
     test.gender = data.gender[21:40]
     
     ## CCM using spearman correlation ##
     K = create.CCM(test.expr, train.expr, method = "spearman")

     ## predict based on the class with the highest mean correlation (the default) ##
     p = predict(K, train.gender)
     table(pred = p, true = test.gender) # check accuracy
    
     ## plot correlations for the 3rd observation ##
     plot(K, train.gender, index = 3, main = "correlations for obs #3", 
	       xlab = "gender", ylab = "correlation") 




