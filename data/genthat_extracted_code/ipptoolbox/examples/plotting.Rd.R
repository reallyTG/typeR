library(ipptoolbox)


### Name: plotting
### Title: Plotting BPAs
### Aliases: dscdf dsecdf dsqqplot dsbel dspl

### ** Examples

print("Plot new BPA")
a=dsstruct(rbind(c(1,2,0.3),c(1.5,5,0.5),c(4,6,0.2)))
dscdf(a)

dscdf(a,xrange=c(0,7),xlab="Important parameter")
print("Bel([-Inf,x])")
bel=dsbel(a)
print("Pl([-Inf,x])")
pl=dspl(a)
points(pl,lwd=5,col='red')
points(bel,lwd=5,col='pink')

print("See if a pbox from N(0,[0.5,1.5]) fits data from N(0,1)")
data=rnorm(100,0,1)
pbox=dsodf(qnorm,1000,0,dsstruct(c(0.5,1.5,1)))
print("Plot pbox")
dscdf(pbox)

print("qq plot")
dsqqplot(pbox,data)



