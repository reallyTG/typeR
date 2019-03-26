library(fanovaGraph)


### Name: thresholdIdentification
### Title: Function to identify a suitable threshold for an 'estimateGraph'
###   object
### Aliases: thresholdIdentification

### ** Examples

############ simple 3-dimensional example with one interaction

### data (usually existing)
x <- matrix(seq(0,1,,20), 20, 3)
x <- apply(x,2,sample)
y <- 2*(x[,1]-0.5) * (x[,2]-0.5) + 0.1*sin(10*x[,3])

### FANVOA graph (usually estimated from a meta model over the data)
g <- list(d=3, 
  tii = matrix(c(0.0140, 0.0008, 0.0002)),
  V = 0.0222, 
  tii.scaled = matrix(c(0.6976, 0.0432, 0.0113))
)
class(g) <- "graphlist"

### plot complete graph
plot(g, plot.i1=FALSE)

### Compare candidate thresholds on prediction performance
set.seed(1)
comparison <- thresholdIdentification(g, x, y, n.cand = 1)


