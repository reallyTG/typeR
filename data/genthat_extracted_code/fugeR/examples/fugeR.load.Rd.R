library(fugeR)


### Name: fugeR.load
### Title: Load a fuzzy system.
### Aliases: fugeR.load

### ** Examples
##
##
## Not run: 
##D fis <- fugeR.run (
##D In,
##D Out,
##D generation=100,
##D population=200,
##D elitism=40,
##D verbose=TRUE,
##D threshold=0.5,
##D sensiW=1.0,
##D speciW=1.0,
##D accuW=0.0,
##D rmseW=1.0,
##D maxRules=10,
##D maxVarPerRule=2,
##D labelsMf=2
##D )
##D 
##D fugeR.save( fis, file=\'./myFis.R\' )
##D 
##D savedFis <- fugeR.load( file=\'./myFis.R\' )
## End(Not run)


