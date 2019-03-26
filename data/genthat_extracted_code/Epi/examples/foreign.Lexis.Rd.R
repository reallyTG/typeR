library(Epi)


### Name: foreign.Lexis
### Title: Create a data structures suitable for use with packages 'mstate'
###   or 'etm'.
### Aliases: msdata msdata.Lexis etm etm.Lexis
### Keywords: survival

### ** Examples

data(DMlate)
str(DMlate)
dml <- Lexis( entry = list(Per=dodm,Age=dodm-dobth,DMdur=0),
               exit = list(Per=dox),
        exit.status = factor(!is.na(dodth),labels=c("DM","Dead")),
               data = DMlate[1:1000,] )
dmi <- cutLexis( dml, cut=dml$doins, new.state="Ins", pre="DM" )
summary( dmi )

# Use the interface to the mstate package
if( require(mstate) )
{
ms.dmi <- msdata.Lexis( dmi )
# Check that all the transitions and person-years got across.
with( ms.dmi, rbind( table(status,trans),
                     tapply(Tstop-Tstart,trans,sum) ) )
}

# Use the etm package directly with a Lexis object
if( require(etm) )
{
dmi <- subset(dmi,lex.id<1000)
etm.D <- etm.Lexis( dmi, time.scale=3 )
str( etm.D )
plot( etm.D, col=rainbow(5), lwd=2, lty=1, xlab="DM duration" )
}



