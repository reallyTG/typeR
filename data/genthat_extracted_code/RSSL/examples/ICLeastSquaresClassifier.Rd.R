library(RSSL)


### Name: ICLeastSquaresClassifier
### Title: Implicitly Constrained Least Squares Classifier
### Aliases: ICLeastSquaresClassifier

### ** Examples

data(testdata)
w1 <- LeastSquaresClassifier(testdata$X, testdata$y, 
                             intercept = TRUE,x_center = FALSE, scale=FALSE)
w2 <- ICLeastSquaresClassifier(testdata$X, testdata$y, 
                               testdata$X_u, intercept = TRUE, x_center = FALSE, scale=FALSE)
plot(testdata$X[,1],testdata$X[,2],col=factor(testdata$y),asp=1)
points(testdata$X_u[,1],testdata$X_u[,2],col="darkgrey",pch=16,cex=0.5)

abline(line_coefficients(w1)$intercept,
       line_coefficients(w1)$slope,lty=2)
abline(line_coefficients(w2)$intercept,
       line_coefficients(w2)$slope,lty=1)




