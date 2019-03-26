library(MM)


### Name: Lindsey
### Title: The Poisson device of Lindsey and Mersch (1992).
### Aliases: Lindsey Lindsey_MB print.Lindsey_output bioChemists

### ** Examples

data(voting)
(o <- Lindsey(voting, voting_tally))
rMM(10,5,o)

data(danaher)
Lindsey_MB(danaher)

## Not run: 
##D   #(takes a long time)
##D data(pollen)
##D Lindsey(pollen)
## End(Not run)

# Example of Lindsey_MB() in use follows.
 
a <- matrix(c(63,40,26,7,69,42,19,5,48,21,16,2,33,11,9,1,21,8,9,0,
    7,8,1,0,5,3,1,0,9,2,0,0),byrow=TRUE,ncol=4)

# Alternatively, you can get this from the pscl package as follows:
# library(pscl); data(bioChemists)
# a <- table(subset(bioChemists, fem == 'Men' & art < 8))

dimnames(a) <- list(papers=0:7,children=0:3)
require(Oarray)
a <- as.Oarray(a,offset=0)
# thus a[3,1]==11 means that 11 subjects had 3 papers and 1 child

summary(Lindsey_MB(a))



