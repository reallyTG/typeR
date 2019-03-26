library(semPlot)


### Name: modelMatrices
### Title: Extract SEM model matrices
### Aliases: modelMatrices
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Mplus user guide SEM example:
outfile <- tempfile(fileext=".out")
download.file("http://www.statmodel.com/usersguide/chap5/ex5.11.out",outfile)

# Plot model:
semPaths(outfile, intercepts = FALSE)

# Extract RAM:
RAM <- modelMatrices(outfile, "ram")
semPaths(do.call(ramModel, RAM), as.expression = "edges", intercepts = FALSE)

# Extract LISREL:
LISREL <- modelMatrices(outfile, "lisrel")
semPaths(do.call(lisrelModel, LISREL), as.expression = "edges", intercepts = FALSE)



