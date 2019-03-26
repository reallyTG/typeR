library(mlrCPO)


### Name: clearRI
### Title: Clear Retrafo and Inverter Attributes
### Aliases: clearRI

### ** Examples

# without clearRI
transformed = iris.task %>>% cpoPca()
transformed2 = transformed %>>% cpoScale()
retrafo(transformed2)  # [RETRAFO pca]=>[RETRAFO scale]

transformed = iris.task %>>% cpoPca()
transformed2 = clearRI(transformed) %>>% cpoScale()
retrafo(transformed2)  # [RETRAFO scale]




