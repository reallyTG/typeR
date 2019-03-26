library(Rlof)


### Name: lof
### Title: Local Outlier Factor
### Aliases: lof
### Keywords: Rlof lof

### ** Examples

## Not run: ---- Detecting the top outliers using the LOF algorithm 
## Not run: ---- with k = 5,6,7,8,9 and 10, respectively----
data(iris)
df<-iris[-5]
## No test: 
df.lof<-lof(df,c(5:10),cores=2)
## End(No test)



