library(fmsb)


### Name: IndexOfDissimilarity
### Title: Index of dissimilarity (ID)
### Aliases: IndexOfDissimilarity

### ** Examples

 # Dissimilarities of Japanese population structure were increasing
 # from 1960-1980 (0.132) to 1980-2000 (0.156).
 IndexOfDissimilarity(Jpopl$M1980+Jpopl$F1980, Jpopl$M2000+Jpopl$F2000)
 IndexOfDissimilarity(Jpopl$M1980+Jpopl$F1980, Jpopl$M1960+Jpopl$F1960)



