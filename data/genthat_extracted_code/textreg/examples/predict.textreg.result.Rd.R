library(textreg)


### Name: predict.textreg.result
### Title: Predict labeling with the selected phrases.
### Aliases: predict.textreg.result

### ** Examples

res = textreg( c( "", "", "A", "A" ), c( -1, -1, 1, 1 ), 
      C=1, Lq=1, convergence.threshold=0.00000001, verbosity=0 )
predict( res )
predict( res, new.text=c("A B C A") )



