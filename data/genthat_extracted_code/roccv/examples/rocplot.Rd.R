library(roccv)


### Name: rocplot
### Title: Create ROC plot from cross validation results
### Aliases: rocplot

### ** Examples

x <- matrix(rnorm(800),ncol=8)
y <- runif(100) < exp(1 + x[,1] + x[,5])/(1+exp(1 + x[,1] + x[,5]))
cv_results <- cv(x,y=y,method_name="without_formula")
combined_data <- data.frame(y=y,x1=x[,1],x5=x[,5])
gx <- x[,c(2,3,4,6,7,8)]
cvf <- cv(genomic_x=gx,clinical_formula=y~x1+x5,
			data=combined_data,method_name="with_form")
total_results <- rbind(cv_results,cvf)
rocplot(total_results,main="rocplot test")



