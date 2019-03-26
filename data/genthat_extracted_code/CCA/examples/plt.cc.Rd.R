library(CCA)


### Name: plt.cc
### Title: Graphical outputs for canonical correlation analysis
### Aliases: plt.cc
### Keywords: dplot

### ** Examples

data(nutrimouse)
X=as.matrix(nutrimouse$gene[,1:10])
Y=as.matrix(nutrimouse$lipid)
res.cc=cc(X,Y)
plt.cc(res.cc)
plt.cc(res.cc,d1=1,d2=3,type="v",var.label=TRUE)



