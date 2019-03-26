library(Epi)


### Name: transform.Lexis
### Title: Transform a Lexis (or stacked.Lexis) objects
### Aliases: transform.Lexis Relevel.Lexis transform.stacked.Lexis
###   factorize factorize.Lexis levels.Lexis order.Lexis sort.Lexis
### Keywords: manip

### ** Examples

data( nickel )
nic <- Lexis( data = nickel,
                id = id,
             entry = list(age=agein),
              exit = list(age=ageout,cal=ageout+dob,tfh=ageout-age1st),
    ## Lung cancer deaths are coded 2 and other deaths are coded 1
       exit.status = ( (icd > 0) + (icd %in% c(162,163)) ) )
str( nic )
levels( nic )
nit <- transform( nic, cumex = exposure*(agein-age1st) )
str( nit )
## It is still a Lexis object!
summary( nic )
nix <- factorize.Lexis( nic, c("Alive","Lung","Dead"))
niw <- factorize.Lexis( nix, c("Alive","Pulm","Mort"))
niz <- factorize.Lexis( niw, states=list("Alive",c("Pulm","Mort")), coll=" \n& ")
boxes( niw, boxpos=TRUE )
par( new=TRUE )
boxes( niz, boxpos=TRUE )
siw <- stack( niw )
str( siw )



