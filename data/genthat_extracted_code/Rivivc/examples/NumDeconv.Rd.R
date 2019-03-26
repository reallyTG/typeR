library(Rivivc)


### Name: NumDeconv
### Title: Numerical deconvolution method
### Aliases: NumDeconv
### Keywords: NumDeconv deconvolution

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

#setting accuracy for both interpolation modes
accur_explic<-10
accur_implic<-5


#for deconvolution
result<-NumDeconv(impulse_mtx,resp_mtx,explicit.interp=accur_explic,implicit.interp=accur_implic)


print("Raw results")
print(result$par)

print("Explicit interpolation")
print(result$par_explicit)


print("Implicit interpolation")
print(result$par_implicit)

#let's compare the deconvolved curve with known input
dev.new()
plot(input_mtx)
lines(result$par, type="l", col="blue")





