library(Rivivc)


### Name: NumConv
### Title: Numerical convolution
### Aliases: NumConv
### Keywords: NumConv convolution

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

#setting interpolation accuracy
accur_explic<-1000

#run convolution
result<-NumConv(impulse_mtx,input_mtx,explicit.interp=accur_explic)

print("Raw results")
print(result$par)

print("Raw results explicit")
print(result$par_explicit)

dev.new()
plot(resp_mtx)
lines(result$par, type="l", col="blue")

dev.new()
plot(resp_mtx)
lines(result$par_explicit, type="l", col="blue")




