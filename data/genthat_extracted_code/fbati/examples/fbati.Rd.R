library(fbati)


### Name: fbati
### Title: fbati
### Aliases: fbati
### Keywords: interface

### ** Examples

## Data is simulated according to the formula in the
##  paper (you can see it from the code).

## Set the seed so you get the same results
set.seed(13)

## Constants (you can vary these)
NUM_FAMILIES <- 500
AFREQ <- 0.1  ## Allele frequency
BG <- -0.25   ## main effect of gene
BE <- 0       ## main effect of environment
BGE <- 0.75   ## main gene-environment effect
ENV <- 0.2    ## environmental exposure frequency

## (but don't modify this one)
MAX_PROB <- exp( BG*2 + BE*1 + BGE*2*1 )

#####################################
## Create a random dataset (trios) ##
#####################################

## -- genotypes are set to missing for now,
##    everyone will be affected
ped <- as.ped( data.frame( pid = kronecker(1:NUM_FAMILIES,c(1,1,1)),
                           id = kronecker( rep(1,NUM_FAMILIES), c(1,2,3) ),
                           idfath = kronecker( rep(1,NUM_FAMILIES), c(0,0,1) ),
                           idmoth = kronecker( rep(1,NUM_FAMILIES), c(0,0,2) ),
                           sex = rep(0,NUM_FAMILIES*3),
                           AffectionStatus = kronecker( rep(1,NUM_FAMILIES), c(0,0,2) ),
                           m0.a = rep(0,NUM_FAMILIES*3),      ## missing for now
                           m0.b = rep(0,NUM_FAMILIES*3) ) )   ## missing for now
## -- envioronment not generated yet
phe <- as.phe( data.frame( pid = ped$pid,
                           id = ped$id,
                           env = rep(NA,NUM_FAMILIES*3) ) )   ## missing for now

## 50/50 chance of each parents alleles
mendelTransmission <- function( a, b ) {
  r <- rbinom( length(a), 1, 0.75 )
  return( a*r + b*(1-r) )
}

## Not the most efficient code, but it gets it done;
##  takes < 5 sec on pentium M 1.8Ghz
CUR_FAMILY <- 1
while( CUR_FAMILY<=NUM_FAMILIES ) {
  ## Indexing: start=father, (start+1)=mother, (start+2)=child
  start <- CUR_FAMILY*3-2

  ## Draw the parental genotypes from the population
  ped$m0.a[start:(start+1)] <- rbinom( 1, 1, AFREQ ) + 1
  ped$m0.b[start:(start+1)] <- rbinom( 1, 1, AFREQ ) + 1

  ## Draw the children's genotype from the parents
  ped$m0.a[start+2] <- mendelTransmission( ped$m0.a[start], ped$m0.b[start] )
  ped$m0.b[start+2] <- mendelTransmission( ped$m0.a[start+1], ped$m0.b[start+1] )

  ## Generate the environment
  phe$env[start+2] <- rbinom( 1, 1, ENV )

  ## and the affection status
  Xg <- as.integer(ped$m0.a[start+2]==2) + as.integer(ped$m0.b[start+2]==2)
  if( rbinom( 1, 1, exp( BG*Xg + BE*phe$env[start+2] + BGE*Xg*phe$env[start+2] ) / MAX_PROB ) == 1 )
    CUR_FAMILY <- CUR_FAMILY + 1
  ## otherwise it wasn't a valid drawn individual
}


##############
## Analysis ##
##############

## Print the first 4 families
print( head( ped, n=12 ) )
print( head( phe, n=12 ) )

## NOTE: We could have just put all of this info into a single dataframe otherwise,
##  that would look like just the results of this
data <- mergePhePed( ped, phe )
print( head( data, n=12 ) )

## And run the analysis on all the markers
fbati( ped=ped, phe=phe, env="env" )

## Or do it via the merged data.frame object
##  7 and 8 correspond to the marker columns
fbati( data=data, env="env", marker=c(7,8) )

## You may also want to up the number of Monte-Carlo
##  iterations from the default

## And we could also run a joint test instead
##  (see fbatj)
fbatj( ped=ped, phe=phe, env="env" )
fbatj( data=data, env="env", marker=c(7,8) )

## Not run: 
##D ## This won't be run, but we could do this with the gui.
##D ## It requires the data to be written to disk, so we do so:
##D write.ped( ped, "simulated" )
##D write.phe( phe, "simulated" )
##D ## Then start the GUI -- specify the options as before,
##D ##  but for the first two, navigate to the 'simulated.ped' and 'simulated.phe' files.
##D fbati()
## End(Not run)



