library(Epi)


### Name: N2Y
### Title: Create risk time ("Person-Years") in Lexis triangles from
###   population count data.
### Aliases: N2Y
### Keywords: Data

### ** Examples

# Danish population at 1 Jan each year by sex and age
data( N.dk )
# An illustrative subset
( Nx <- subset( N.dk, sex==1 & A<5 & P<1975 ) )
# Show the data in tabular form
xtabs( N ~ A + P, data=Nx )
# Lexis triangles as data frame
Nt <- N2Y( data=Nx, return.dfr=TRUE )
xtabs( Y ~ round(A,2) + round(P,2), data=Nt )
# Lexis triangles as a 3-dim array
ftable( N2Y( data=Nx, return.dfr=FALSE ) )

# Calculation of PY for persons born 1970 in 1972
( N.1.1972 <- subset( Nx, A==1 & P==1972)$N )
( N.2.1973 <- subset( Nx, A==2 & P==1973)$N )
N.1.1972/3 + N.2.1973/6
N.1.1972/6 + N.2.1973/3
# These number can be found in the following plot:

# Blue numbers are population size at 1 January
# Red numbers are the computed person-years in Lexis triangles:
Lexis.diagram(age=c(0,5), date=c(1970,1975), int=1, coh.grid=TRUE )
with( Nx, text(P,A+0.5,paste(N),srt=90,col="blue") )
with( Nt, text(P,A,formatC(Y,format="f",digits=1),col="red") )
text( 1970.5, 2, "Population count 1 January", srt=90, col="blue")
text( 1974.5, 2, "Person-\nyears", col="red")



