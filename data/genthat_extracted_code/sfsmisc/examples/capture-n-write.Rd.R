library(sfsmisc)


### Name: capture.and.write
### Title: Capture output and Write / Print First and Last Parts
### Aliases: capture.and.write

### ** Examples

x <- seq(0, 10, by = .1)

## for matrix, dataframe, .. first lines include a header line:
capture.and.write( cbind(x, log1p(exp(x))),  first = 5)

## first, *middle* and last :
capture.and.write( cbind(x, x^2, x^3), first = 4, middle = 3, n.dots= 1)



