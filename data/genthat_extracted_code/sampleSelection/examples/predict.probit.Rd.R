library(sampleSelection)


### Name: predict.probit
### Title: Predict method for fitted probit models
### Aliases: predict.probit
### Keywords: methods

### ** Examples

## female labour force participation probability
data( "Mroz87" )
m <- probit( lfp ~ kids5 + kids618 + educ + hushrs +
   huseduc + huswage + mtr + motheduc, data=Mroz87 )
predict( m )                            # equal to linearPredictors(m)
predict( m, type = "response" )         # equal to fitted(m)
predict( m, newdata = Mroz87[ 3:9, ] )  # equal to linearPredictors(m)[3:9]
predict( m, newdata = Mroz87[ 3:9, ], type = "response" ) # equal to fitted(m)[3:9]



