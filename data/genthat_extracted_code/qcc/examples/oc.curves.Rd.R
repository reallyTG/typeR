library(qcc)


### Name: oc.curves
### Title: Operating Characteristic Function
### Aliases: oc.curves oc.curves.xbar oc.curves.R oc.curves.S oc.curves.p
###   oc.curves.c
### Keywords: htest hplot

### ** Examples

data(pistonrings)
attach(pistonrings)
diameter <- qcc.groups(diameter, sample)
beta <- oc.curves.xbar(qcc(diameter, type="xbar", nsigmas=3, plot=FALSE))
print(round(beta, digits=4))
# or to identify points on the plot use
## Not run: oc.curves.xbar(qcc(diameter, type="xbar", nsigmas=3, plot=FALSE), identify=TRUE)
detach(pistonrings)

data(orangejuice)
attach(orangejuice)
beta <- oc.curves(qcc(D[trial], sizes=size[trial], type="p", plot=FALSE))
print(round(beta, digits=4))
# or to identify points on the plot use
## Not run: oc.curves(qcc(D[trial], sizes=size[trial], type="p", plot=FALSE), identify=TRUE)
detach(orangejuice)

data(circuit)
attach(circuit)
q <- qcc(x[trial], sizes=size[trial], type="c", plot=FALSE)
beta <- oc.curves(q)
print(round(beta, digits=4))
# or to identify points on the plot use
## Not run: oc.curves(qcc(x[trial], sizes=size[trial], type="c", plot=FALSE), identify=TRUE)
detach(circuit)



