library(IM)


### Name: checkOrder
### Title: Find the maximum order of finite moments
### Aliases: checkOrder checkOrder-methods checkOrder,matrix-method
### Keywords: misc

### ** Examples

data(lena);

obj= momentObj(img, "cheby", c(300,200));

maxOrder= checkOrder(obj@moments);



