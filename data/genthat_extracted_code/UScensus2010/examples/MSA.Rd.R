library(UScensus2010)


### Name: MSA
### Title: Selects one MSA from a given state.
### Aliases: MSA
### Keywords: shapefiles demography msa

### ** Examples

## Not run: 
##D ## Load the data files for MSA names and MSA FIPS codes
##D data(MSAnames)
##D data(MSAfips)
##D 
##D ## Save the FIPS code for Abilene, TX MSA
##D ab.fips<-MSAfips$msa.cmsa.fips[1]
##D 
##D ###Use the MSA FIPS code
##D Abilene<-MSA(msafips=ab.fips,level="tract")
##D 
##D ###USe the MSA full name
##D Abilene<-MSA(msaname="Abilene, TX MSA",level="tract")
##D 
##D ##Use the msaname alternative
##D portland<-MSA(msaname="Portland",state="OR",level="tract")
##D 
##D 
##D ##Plot Portland
##D plot(portland)
##D title("Portland MSA, OR 2000")
## End(Not run)



