library(pairwise)


### Name: pairSE
### Title: Item Parameter calculation with Standard Errors for polytomous
###   Partial Credit Model
### Aliases: pairSE

### ** Examples

data(bfiN) # loading example data set

# calculating itemparameters and their SE for 5 neuroticism items with 6 answer categories (0-5).
neuro_itempar<-pairSE(daten = bfiN, m = 6) 
summary(neuro_itempar) # summary for result

# plotting item thresholds with with their CI = 95% 
plot(neuro_itempar)
plot(neuro_itempar,sortdif=TRUE)

###### example from details section 'Some Notes on Standard Errors' ########
neuro_itempar_400<-pairSE(daten = bfiN, m = 6,nsample=400)
plot(neuro_itempar) 
plot(neuro_itempar_400) 
   



