library(pairwise)


### Name: pair
### Title: Rasch Item Parameter (Main Function)
### Aliases: pair

### ** Examples

data(bfiN) # loading example data set
# calculating itemparameters for 5 neuroticism items with 6 answer categories (0-5).
neuro_itempar<-pair(daten = bfiN, m = 6) 
summary(neuro_itempar) 
summary(neuro_itempar, sortdif=TRUE) # ordered by difficulty 
# plotting threshold profiles for 5 neuroticism items.
plot(neuro_itempar) 
plot(neuro_itempar, sortdif=TRUE) # plotting ordered by difficulty 
################ with unequal number of categories 
data(sim200x3)
res<-pair(sim200x3)
summary(res)
plot(res)



