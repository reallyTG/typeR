library(OpenMx)


### Name: omxCheckError
### Title: Correct Error Message Function
### Aliases: omxCheckError

### ** Examples

A <- mxMatrix('Full', 1, 1, labels = 'data.foo', free = TRUE, name = 'A')
model <- mxModel('model', A)
omxCheckError(mxRun(model), 
paste("The definition variable 'data.foo'",
	"has been assigned to a",
	"free parameter in matrix 'A'"))
omxCheckCloseEnough(matrix(3, 3, 3), matrix(4, 3, 3), epsilon = 2)
# Throws error, check the message
tmsg <- paste("In omxCheckCloseEnough(c(1, 2, 3), c(1.1, 1.9, 3), 0.01)",
	": not equal to within 0.01 : '1 2 3' and '1.1 1.9 3'")
omxCheckError(omxCheckCloseEnough(c(1, 2, 3), c(1.1, 1.9 ,3.0), .01), tmsg)



