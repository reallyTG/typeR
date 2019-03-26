library(sisal)


### Name: plot.sisal
### Title: Plotting Sequential Input Selection Results
### Aliases: plot.sisal
### Keywords: hplot graphs IO

### ** Examples

library(graphics)
foo <- testSisal(dataset="toy", Mtimes=10)
## Plotting the search graph requires "Rgraphviz" and "graph"
if (requireNamespace("Rgraphviz", quietly=TRUE) &&
    requireNamespace("graph", quietly=TRUE)) {
    plot(foo, which=2)
}
## Default output is a mean squared error plot
plot(foo)



