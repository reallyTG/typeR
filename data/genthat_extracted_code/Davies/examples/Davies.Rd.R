library(Davies)


### Name: Davies
### Title: The Davies distribution
### Aliases: Davies davies ddavies pdavies qdavies rdavies ddavies.p
### Keywords: distribution

### ** Examples

params <- c(10,0.1,0.1)
x <- seq(from=4,to=20,by=0.2)
p <- seq(from=1e-3,to=1-1e-3,len=50)

rdavies(n=5,params)
least.squares(rdavies(100,params))
plot(pdavies(x,params))


plot(p,qdavies(p,params))
plot(x,ddavies(x,params),type="b")




