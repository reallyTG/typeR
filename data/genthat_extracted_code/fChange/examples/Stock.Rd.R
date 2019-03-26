library(fChange)


### Name: Stock
### Title: Intra-Day Stock Price Data Sets
### Aliases: Stock
### Keywords: datasets

### ** Examples

 library(fda)
 # transform first 100 days of Chevron data into functional data object
 data = as.matrix(Stock$Chevron[,1:100])
 # First need to transform the data to obtain the log returns
 temp1=data
 for(j in c(1:dim(data)[1])){
  for(k in c(1:dim(data)[2])){
    data[j,k]=100*(log(temp1[j,k])-log(temp1[1,k]))
  }
}
# Transform the Log return data into functional data
#using 21 bspline basis functions on [0,1]
D=21
basis =  create.bspline.basis(rangeval = c(0, 1), nbasis = D)
Domain = seq(0, 1, length = nrow(data))
f_data = Data2fd(argvals = Domain , data, basisobj = basis)
plot(f_data)



