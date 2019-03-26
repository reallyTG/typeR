library(BatchExperiments)


### Name: makeDesign
### Title: Create parameter designs for problems and algorithms.
### Aliases: makeDesign Design

### ** Examples

## Not run: 
##D # simple design for algorithm "a1" with no parameters:
##D design = makeDesign("a1")
##D 
##D # design for problem "p1" using predefined parameter combinations
##D design = makeDesign("p1", design = data.frame(alpha = 0:1, beta = c(0.1, 0.2)))
##D 
##D # creating a list of designs for several algorithms at once, all using the same
##D # exhaustive grid of parameters
##D designs = lapply(c("a1", "a2", "a3"), makeDesign,
##D                   exhaustive = list(alpha = 0:1, gamma = 1:10/10))
## End(Not run)



