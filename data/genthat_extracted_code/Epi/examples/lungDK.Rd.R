library(Epi)


### Name: lungDK
### Title: Male lung cancer incidence in Denmark
### Aliases: lungDK
### Keywords: datasets

### ** Examples

data( lungDK )
# Draw a Lexis diagram and show the number of cases in it.
attach( lungDK )
Lexis.diagram( age=c(40,90), date=c(1943,1993), coh.grid=TRUE )
text( Px, Ax, paste( D ), cex=0.7 )



