library(ecotoxicology)


### Name: CalculateLC50
### Title: Calculate LC50 from a matrix with 3 columns: concentration,
###   number of exposed subjects and number of deaths
### Aliases: CalculateLC50

### ** Examples

#Data from the example on page 5:
#Hamilton, m.a., R.c. Russo, and r.v. Thurston, 1977.
#Trimmed spearman-karber method for estimating median
#Lethal concentrations in toxicity bioassays.
#Environ. Sci. Technol. 11(7): 714-719;
#Correction 12(4):417 (1978).
concentration<-c(.5,1,2,4,8)
exposed<-c(10,10,10,10,10)
mortality<-c(0,2,4,9,10)
CalculateLC50(cbind(concentration, exposed, mortality))



