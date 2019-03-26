library(emdbook)


### Name: scinot
### Title: Scientific notation as LaTeX/expression()
### Aliases: scinot axis.scinot
### Keywords: misc

### ** Examples

scinot(1e-5)
scinot(1e-5,digits=0)
scinot(1e-5,"expression")
scinot(1e-5,"expression",pref="p=")
set.seed(1001)
plot(1:100,rlnorm(100,0,2),log="y",axes=FALSE)
axis(side=1)
axis.scinot(side=2)  ## fix bug!



