library(paleoTS)


### Name: cat.paleoTS
### Title: Miscellaneous functions used internally for punctuations
### Aliases: cat.paleoTS split4punc shifts shift2gg
### Keywords: models ts

### ** Examples

 # show all possible shift points for 20 samples divided into two semgments 
 # (assuming each has at least 6 samples)
 GG<- shifts(ns=20, ng=2, minb=6)
 print (GG)
 # show resulting grouping vector from first of these
 gg<- shift2gg(GG[,1], ns=20)
 print (gg)
 



