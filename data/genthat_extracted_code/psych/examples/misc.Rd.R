library(psych)


### Name: psych.misc
### Title: Miscellaneous helper functions for the psych package
### Aliases: psych.misc misc tableF lowerCor lowerMat progressBar reflect
###   shannon test.all cor2 levels2numeric char2numeric isCorrelation
###   fromTo cs acs
### Keywords: multivariate

### ** Examples

lowerMat(Thurstone)
lb <- lowerCor(bfi[1:10])  #finds and prints the lower correlation matrix, 
  # returns the square matrix.
#fiml <- corFiml(bfi[1:10])     #FIML correlations require lavaan package
#lowerMat(fiml)  #to get pretty output
f3 <- fa(Thurstone,3)
f3r <- reflect(f3,2)  #reflect the second factor
#find the complexity of the response patterns of the iqitems.
round(shannon(iqitems),2) 
#test.all('BinNor')  #Does the BinNor package work when we are using other packages
bestItems(lb,3,cut=.1)
#to make this a latex table 
#df2latex(bestItems(lb,2,cut=.2))
#
data(bfi.dictionary)
f2 <- fa(bfi[1:10],2)
fa.lookup(f2,bfi.dictionary)

sa1 <-sat.act[1:2]
sa2 <- sat.act[3:4]
sa3 <- sat.act[5:6]
cor2(sa1,sa2)
cor2(list(sa1,sa2))  #show within set and between set cors
cor2(list(sa1,sa2,sa3))
lowerCor(fromTo(sat.act,"ACT","SATQ")) #show some correlations
vect <- cs(ACT,SATQ)  #skip the quotes
vect   #they are in this vector
#to combine longer terms
vect <- cs("Here is a longish",vector, that, we ,"want to combine", into, several)
vect
temp <- acs("Here is a longish",vector, that, we ,"want to combine", into, one)
temp
lowerCor(fromTo(sat.act,cs(ACT,SATQ)))  






