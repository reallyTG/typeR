# utility-test.ssc
library(PreProcess)

# matrix reorganization
mat <- matrix(1:15, 5, 3)
mat
flipud(mat)
fliplr(mat)

set.seed(473824)
# concordance
x <- rnorm(1000, 1, 2)
y <- rnorm(1000, 1, 2)
f.above.thresh(x, 0)
f.above.thresh(y, 0)
f.cord(x, y)
z <- scale(x)
f.cord(x, z)

#plotting ellipses
plot(x,y)
ellipse(1, 1, type='l', lwd=2)
ellipse(3, 2, type='l', lwd=2, col='blue')

# other weird stuff
f.qq(x, main='Demo', col='blue')
f.qq(x, cut=3)
f.qt(x, df = 3)
f.qt(x, df = 40)

# cleanup utility test
rm(x, y, mat, z)

