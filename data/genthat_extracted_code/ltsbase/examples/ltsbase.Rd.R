library(ltsbase)


### Name: ltsbase
### Title: Ridge and Liu Estimates based on LTS Method
### Aliases: ltsbase

### ** Examples

data(hbk)
y=hbk[,4]
xdata=data.frame(hbk[,1:3])
model=ltsbase(xdata, y, print=FALSE, plot=TRUE, alpha=0.875, by=0.001)



