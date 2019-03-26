library(labstatR)


### Name: birthday
### Title: Calcola la probabilita' di compleanni coincidenti
### Aliases: birthday
### Keywords: distribution

### ** Examples

n <- c(5,10,15,20,21,22,23,24,25,30,50,60,
       70,80,90,100,200,300,365)
for(i in n)
 cat("\n n=",i,"P(A)=",birthday(i))



