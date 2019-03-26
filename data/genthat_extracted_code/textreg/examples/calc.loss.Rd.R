library(textreg)


### Name: calc.loss
### Title: Calculate total loss of model (Squared hinge loss).
### Aliases: calc.loss

### ** Examples

data( testCorpora )
res = textreg( c( "", "", "A", "A" ), c( -1, -1, 1, 1 ), C=1, Lq=1,
          convergence.threshold=0.00000001, verbosity=0 )
calc.loss( res )
calc.loss( res, new.text=c("A B C A"), new.labeling=c(1) )



