library(simstandard)


### Name: matrix2lavaan
### Title: Create lavaan model syntax from matrix coefficients
### Aliases: matrix2lavaan

### ** Examples

library(simstandard)
# Specifying the measurement model:
# For a data.frame, the column names are latent variables,
# and the indictors can be specified as rownames.
m <- data.frame(X = c(0.7,0.8,0,0),
                Y = c(0,0,0.8,0.9))
rownames(m) <- c("A", "B", "C", "D")
# Indicator variables can also be specified
# as the first column variable
# with subsequent column names as latent variables
m <- data.frame(Indicators = c("A", "B", "C", "D"),
                X = c(0.7,0.8,0,0),
                Y = c(0,0,0.8,0.9))
# Alternately, a matrix can be used:
m <- matrix(c(0.7,0.8,0,0,
              0,0,0.8,0.9),
              ncol = 2,
              dimnames = list(c("A", "B", "C", "D"),
                              c("X", "Y")))
# Specifying the structural coefficients:
# The regression coefficients of the structural model can be
# specified as either a data.frame or a matrix. Column names
# are the predictors and row names are the criterion variables.
# With a data.frame, criterion variables can alternataly be
# specified with as the first column.
s <- matrix(0.5, nrow = 1, ncol = 1, dimnames = list("Y", "X"))
# The covariance matrix must be symmetric. Can also be specified
# as a data. frame.
Sigma <- matrix(c(1, 0.3,
                  0.3, 1),
                nrow = 2,
                ncol = 2,
                dimnames = list(c("B","C"),
                                c("B","C")) )
model <- matrix2lavaan(measurement_model = m,
                       structural_model = s,
                       covariances = Sigma)
cat(model)



