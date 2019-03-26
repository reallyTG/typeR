library(psych)


### Name: bfi
### Title: 25 Personality items representing 5 factors
### Aliases: bfi bfi.dictionary
### Keywords: datasets

### ** Examples

data(bfi)
describe(bfi)
 
 keys.list <-
  list(agree=c("-A1","A2","A3","A4","A5"),conscientious=c("C1","C2","C3","-C4","-C5"),
extraversion=c("-E1","-E2","E3","E4","E5"),neuroticism=c("N1","N2","N3","N4","N5"),
openness = c("O1","-O2","O3","O4","-O5")) 
 scores <- scoreItems(keys.list,bfi,min=1,max=6) #specify the minimum and maximum values
 scores
 #show the use of the fa.lookup with a dictionary
 keys.lookup(keys.list,bfi.dictionary[,1:4])
 



