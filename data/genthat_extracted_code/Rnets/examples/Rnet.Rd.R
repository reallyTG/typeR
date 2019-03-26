library(Rnets)


### Name: Rnet
### Title: R-net Methods
### Aliases: Rnet Rnet,ANY,ANY,ANY,ANY,ANY,ANY,ANY,ANY,expression-method
###   Rnet,ANY,ANY,ANY,ANY,ANY,ANY,ANY,ANY,character-method

### ** Examples

#Create a single R-net for all E. coli isolates in the provided dataset. 
#Vertices to be used defined by 'ABX_LIST' below.
#Edges require at least 20 observations to be valid.

ABX_LIST <- c('AMP', 'AMC', 'AXO', 'TIO', 'NAL', 'CIP', 'STR', 'GEN', 'COT', 'FIS')

EC_Rnet_ALL <- Rnet(x = NARMS_EC_DATA, 
						L1 = 0.3, 
						vertices = ABX_LIST, 
						n_min = 20
						)
class(EC_Rnet_ALL)[1]	#EC_Rnet_ALL is a 'rnetBasic' object
print(EC_Rnet_ALL)	#Basic Rnet information
summary(EC_Rnet_ALL) 	#More detailed information

#Create a single R-net for only E. coli isolates collected during 2008
EC_Rnet_2008 <- Rnet(x = NARMS_EC_DATA, 
						L1 = 0.3, 
						vertices = ABX_LIST, 
						n_min = 20,
					subset = expression(Year == 2008)
						)
class(EC_Rnet_2008)[1]	#EC_Rnet_ALL is an 'rnet.stratum' object

#Create a set of R-nets, one for each year of E.coli isolates.
EC_Rnet_byYear <- Rnet(x = NARMS_EC_DATA, 
						L1 = 0.3, 
						vertices = ABX_LIST, 
						n_min = 20,
					subset = 'Year'
						)
class(EC_Rnet_byYear)[1]	#EC_Rnet_ALL is an 'rnetMultiStrata' object



