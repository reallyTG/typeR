library(SDMTools)


### Name: lcmw
### Title: Least Cost Moving Windows Calculation
### Aliases: lcmw

### ** Examples

#create a simple object of class 'asc'
tasc = as.asc(matrix(1:100,nr=10,nc=10)); print(tasc)

#show the input matrix
print(tasc[1:10,1:10])

#vary the moving windows

###no cost window of 2 cell radius
tcost = matrix(0,nr=5,nc=5); print(tcost)
out = lcmw(tasc, tcost, 2); print(out[1:10,1:10])

###no cost with a circular radius of 2
tcost = matrix(NA,nr=5,nc=5)
#populate the distances
for (y in 1:5){
    for (x in 1:5){
        tcost[y,x] = sqrt((3-y)^2 + (3-x)^2)
    }
}

#remove distance values > max.num.cells
tcost[which(tcost>2)]=NA

#no cost matrix
tcost1 = tcost; tcost1[is.finite(tcost1)]=1; print(tcost1)
out = lcmw(tasc, tcost1, 2); print(out[1:10,1:10])

#linear cost
tcost = tcost/2; print(tcost)
out = lcmw(tasc, tcost, 2); print(out[1:10,1:10])



