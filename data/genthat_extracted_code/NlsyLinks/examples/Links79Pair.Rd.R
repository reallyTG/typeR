library(NlsyLinks)


### Name: Links79Pair
### Title: Kinship linking file for pairs of relatives in the NLSY79 and
###   NLSY79 Children and Young Adults
### Aliases: Links79Pair
### Keywords: datasets

### ** Examples

library(NlsyLinks) #Load the package into the current R session.
summary(Links79Pair)  #Summarize the five variables.
hist(Links79Pair$R)  #Display a histogram of the Relatedness coefficients.
table(Links79Pair$R)  #Create a table of the Relatedness coefficients for the whole sample.

#Create a dataset of only Gen2 sibs, and display the distribution of R.
gen2Siblings <- subset(Links79Pair, RelationshipPath=='Gen2Siblings')
table(gen2Siblings$R)  #Create a table of the Relatedness coefficients for the Gen2 sibs.




