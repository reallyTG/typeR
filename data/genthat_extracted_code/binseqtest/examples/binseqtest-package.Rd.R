library(binseqtest)


### Name: binseqtest-package
### Title: Binary sequential tests
### Aliases: binseqtest binseqtest-package
### Keywords: package

### ** Examples

# create an O'Brien-Fleming-type design, with 2.5 percent error on each side with max N of 50
B<-designOBF(50)
# plot it
plot(B)
# create a table for N (total samples) values between 20 and 25
stopTable(B,Nrange=c(20,25))
# modify the boundary if you missed looks at N=30 through 35
Bmod<-modify(B,missN=30:35)
plot(Bmod)



