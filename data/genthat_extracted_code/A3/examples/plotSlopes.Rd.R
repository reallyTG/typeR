library(A3)


### Name: plotSlopes
### Title: Plot Distribution of Slopes
### Aliases: plotSlopes

### ** Examples

## No test: 
 require(randomForest)
 data(housing)

 x <- a3(MED.VALUE ~ NOX + PUPIL.TEACHER + ROOMS + AGE + HIGHWAY + 0,
   housing, randomForest, p.acc = NULL, n.folds = 2)

 plotSlopes(x)
 
## End(No test)



