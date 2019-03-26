library(fanovaGraph)


### Name: threshold
### Title: Threshold indices
### Aliases: threshold

### ** Examples

# Kriging model prediction
x <- matrix(runif(100*3,-pi,pi),100,3)
KM <- km(~1, design = data.frame(x), response = ishigami.fun(x))
krigingMean <- function(Xnew) predict(object = KM, newdata = Xnew, 
    type = "UK", se.compute = FALSE, checkNames = FALSE)$mean
    
# full graph estimation
g <- estimateGraph(krigingMean, d=3, n.tot=10000, q.arg=list(min=-pi, max=pi))
print(g[c(2,6)])
# threshold graph
g.cut <- threshold(g, delta = 0.1)
print(g.cut[c(2,6)])



