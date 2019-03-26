library(baitmet)


### Name: setChrmMethod
### Title: Sets the chromatographic method to be used
### Aliases: setChrmMethod

### ** Examples


# To set a new chromatographic method, simply 
# indicate the retention time and indexes of the
# compounds to be used as a reference for a given
# chromatographic method.

ChrM.Plasma <- setChrmMethod(method="alk.var5", 
rt=c(8.39, 10.759, 13.271, 15.604, 17.751, 19.685, 
21.471, 23.126, 24.645), ri=c(1225.27, 1326.95, 
1526.31, 1729.57, 1928.52, 2131.7, 2342.06, 
2548.56, 2739.86))




