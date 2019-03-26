library(Rivivc)


### Name: RivivcA
### Title: Level A linear correlation for a single formulation
### Aliases: RivivcA
### Keywords: RivivcA IVIVC Level A

### ** Examples


require(Rivivc)
require(graphics)

#i.v. data
data("impulse")
#p.o. PK profile
data("resp")
#in vitro dissolution for correlation purposes
data("input")

#preparing data matrices
input_mtx<-as.matrix(input)
impulse_mtx<-as.matrix(impulse)
resp_mtx<-as.matrix(resp)

#setting accuracy
accur_explic<-20
accur_implic<-5

#run deconvolution
result<-RivivcA(input_mtx,impulse_mtx,resp_mtx,explicit.interp=accur_explic,implicit.interp=accur_implic)

summary(result$regression)

print("Raw results of deconvolution")
print(result$numeric$par)

predicted<-predict(result$regression)
deconvolved_data<-unname(predicted)
orig_data<-input_mtx[,2]

dev.new()
plot(orig_data,result$numeric$par[,2])
lines(orig_data,deconvolved_data, type="l", col="blue")
dev.new()
plot(input_mtx)
lines(result$numeric$par, type="l", col="blue")




