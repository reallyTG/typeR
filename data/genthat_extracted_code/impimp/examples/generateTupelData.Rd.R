library(impimp)


### Name: generateTupelData
### Title: Tuple representation
### Aliases: generateTupelData
### Keywords: datagen

### ** Examples

A <- data.frame(x1 = c(1,0), x2 = c(0,0),
                y1 = c(1,0), y2 = c(2,2))
B <- data.frame(x1 = c(1,1,0), x2 = c(0,0,0),
                z1 = c(0,1,1), z2 = c(0,1,2))
AimpB <- impimp(A, B, method = "domain")

## no constraints
generateTupelData(AimpB)

## (y1,z1) = (0,0) as constraint
generateTupelData(AimpB, list(impimp_event(y1 = 0, z1 = 0)))

## No test: 
data(iris)
generateTupelData(iris) # emits a warning
## End(No test)



