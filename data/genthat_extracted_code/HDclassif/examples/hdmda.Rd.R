library(HDclassif)


### Name: hdmda
### Title: Mixture Discriminant Analysis with HD Gaussians
### Aliases: hdmda
### Keywords: mixture discriminant analysis high-dimensional data

### ** Examples

# Load the Wine data set
data(wine)
cls = wine[,1]; X = scale(wine[,-1])

# A simple use...
out = hdmda(X[1:100,],cls[1:100])
res = predict(out,X[101:nrow(X),])

# Comparison between hdmda and hdda in a CV setup
set.seed(123); nb = 10; Err = matrix(NA,2,nb)
for (i in 1:nb){
  cat('.')
  test = sample(nrow(X),50)
  out0 = lda(X[-test,],cls[-test])
  res0 = predict(out0,X[test,])
  Err[1,i] = sum(res0$class != cls[test]) / length(test)
  out = hdmda(X[-test,],cls[-test],K=1:3,model="AKJBQKDK")
  res = predict(out,X[test,])
  Err[2,i] = sum(res$class != cls[test]) / length(test)
}
cat('\n')
boxplot(t(Err),names=c('LDA','HD-MDA'),col=2:3,ylab="CV classifciation error",
  main='CV classifciation error on Wine data')



