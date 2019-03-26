library(stripless)


### Name: strucParseFormula
### Title: Parse Trellis Formula for 'strucplot'
### Aliases: strucParseFormula

### ** Examples

 exdat <- data.frame(x = 1:5, alongname = sample( letters[1:3],5, rep=TRUE),
   butalongername = sample(LETTERS[1:2],5, rep = TRUE))
   y <- runif(5)

 strucParseFormula (y ~ x| alongname*butalongername, data = exdat)

 # The same
 strucParseFormula (y ~ x|., data = exdat)

 # The 'data' argument is required with '.'
 ## Not run: 
##D  strucParseFormula (y ~ x|.)
##D  
## End(Not run)




