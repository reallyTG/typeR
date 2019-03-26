library(psych)


### Name: scoreItems
### Title: Score item composite scales and find Cronbach's alpha, Guttman
###   lambda 6 and item whole correlations
### Aliases: scoreItems scoreFast scoreVeryFast score.items
###   response.frequencies
### Keywords: multivariate models

### ** Examples


#see  the example including the bfi data set
data(bfi)
keys.list <- list(agree=c("-A1","A2","A3","A4","A5"),
  conscientious=c("C1","C2","C3","-C4","-C5"),extraversion=c("-E1","-E2","E3","E4","E5"),
  neuroticism=c("N1","N2","N3","N4","N5"), openness = c("O1","-O2","O3","O4","-O5")) 
  keys <- make.keys(bfi,keys.list)  #no longer necessary
 scores <- scoreItems(keys,bfi,min=1,max=6)  #using a keys matrix 
 scores <- scoreItems(keys.list,bfi,min=1,max=6)  # or just use the keys.list
 summary(scores)
 #to get the response frequencies, we need to not use the age variable
 scores <- scoreItems(keys[1:25,],bfi[1:25]) #we do not need to specify min or max if
           #there are no values (such as age) outside the normal item range.
 scores
 #The scores themselves are available in the scores$scores object.  I.e.,
 describe(scores$scores)
 
 
 #compare this output to that for the impute="none" option for SAPA type data
 #first make many of the items missing in a missing pattern way
 missing.bfi <- bfi
 missing.bfi[1:1000,3:8] <- NA
 missing.bfi[1001:2000,c(1:2,9:10)] <- NA
 scores <- scoreItems(keys.list,missing.bfi,impute="none",min=1,max=6)
 scores
 describe(scores$scores)  #the actual scores themselves
 
 #If we want to delete scales scores for people who did not answer some items for one 
 #(or more) scales, we can do the following:
 
  scores <- scoreItems(keys.list,missing.bfi,totals=TRUE,min=1,max=6) #find total scores
  describe(scores$scores) #note that missing data were replaced with median for the item
  scores$scores[scores$missing > 0] <- NA  #get rid of cases with missing data
  describe(scores$scores)





