library(PairedData)


### Name: yuen.t.test
### Title: Yuen's trimmed mean test
### Aliases: yuen.t.test yuen.t.test.default yuen.t.test.formula
###   yuen.t.test.paired
### Keywords: htest

### ** Examples

z<-rnorm(20)
x<-rnorm(20)+z
y<-rnorm(20)+z+1

# two-sample test
yuen.t.test(x,y)

# one-sample test
yuen.t.test(y,mu=1,tr=0.25)

# paired-sample tests
yuen.t.test(x,y,paired=TRUE)

p<-paired(x,y)
yuen.t.test(p)



