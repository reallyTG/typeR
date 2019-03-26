library(NMF)


### Name: aheatmap
### Title: Annotated Heatmaps
### Aliases: aheatmap

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

## See the demo 'aheatmap' for more examples:
## Not run: 
##D demo('aheatmap')
## End(Not run)

# Generate random data
n <- 50; p <- 20
x <- abs(rmatrix(n, p, rnorm, mean=4, sd=1))
x[1:10, seq(1, 10, 2)] <- x[1:10, seq(1, 10, 2)] + 3
x[11:20, seq(2, 10, 2)] <- x[11:20, seq(2, 10, 2)] + 2
rownames(x) <- paste("ROW", 1:n)
colnames(x) <- paste("COL", 1:p)

## Default heatmap
aheatmap(x)

## Distance methods
aheatmap(x, Rowv = "correlation")
aheatmap(x, Rowv = "man") # partially matched to 'manhattan'
aheatmap(x, Rowv = "man", Colv="binary")

# Generate column annotations
annotation = data.frame(Var1 = factor(1:p %% 2 == 0, labels = c("Class1", "Class2")), Var2 = 1:10)
aheatmap(x, annCol = annotation)



