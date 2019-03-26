library(sampleSelection)


### Name: predict.selection
### Title: Predict method for fitted sample selection models
### Aliases: predict.selection
### Keywords: methods

### ** Examples

## Greene( 2003 ): example 22.8, page 786
data( Mroz87 )
Mroz87$kids  <- ( Mroz87$kids5 + Mroz87$kids618 > 0 )

# ML estimation
m <- selection( lfp ~ age + I( age^2 ) + faminc + kids + educ,
   wage ~ exper + I( exper^2 ) + educ + city, Mroz87 )
   
predict( m )
predict( m, type = "conditional" ) 
predict( m, type = "link" ) 
predict( m, type = "response" ) 
predict( m, newdata = Mroz87[ 3:9, ] ) 



