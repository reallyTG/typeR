library(sac)


### Name: Pvalues
### Title: The p-values of Test Statistics Based on Asymptotic Distribution
### Aliases: p.OneChange p.Epidemic.Vn p.Epidemic.Wn
### Keywords: htest

### ** Examples

require(sac) #load the package
# one-change alternative
k<-10
n<-30
x<-rnorm(n,0,1)
x[(k+1):n]<-x[(k+1):n]+1.5
T<-SemiparChangePoint(x, alternative = "one.change")$Sn
p.OneChange(n, d=1, T)

# epidemic alternative
k<-5
m<-10
n<-20
x<-rnorm(n,0,1)
x[(k+1):m]<-x[(k+1):m]+1.5
res<-SemiparChangePoint(x, alternative = "e")
V<-res$Vn; W<-res$Wn
p.Epidemic.Vn(V, d=1)
p.Epidemic.Wn(W)



