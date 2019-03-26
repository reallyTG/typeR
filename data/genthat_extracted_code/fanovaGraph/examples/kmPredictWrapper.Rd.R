library(fanovaGraph)


### Name: kmPredictWrapper
### Title: Wrapper for the Kriging model prediction
### Aliases: kmPredictWrapper

### ** Examples

### graph estimation of a kriging prediction of the ishigami function
set.seed(1)
x <- matrix(runif(150,-pi,pi),100,3)
y <- ishigami.fun(x)
KM <- km(~1, design = data.frame(x), response = y)

g <- estimateGraph(f.mat = kmPredictWrapper, d = 3, n.tot = 10000, q.arg = 
  list(min = -pi, max = pi), method = "LiuOwen", km.object = KM) 
print(g$tii)



