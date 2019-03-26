library(ddalpha)


### Name: infimalRank
### Title: Adjusted Ranking of Functional Data Based on the Infimal Depth
### Aliases: infimalRank
### Keywords: depth functional rank

### ** Examples

datafA = dataf.population()$dataf[1:20]
datafB = dataf.population()$dataf[21:50]
D = depthf.fd1(datafA,datafB)
infimalRank(D$Half_ID,D$Half_IA) 

ID = c(0,1,0,0,0,1,1)
IA = c(2,3,1,0,2,4,1)
infimalRank(ID,IA)



