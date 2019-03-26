library(pcIRT)


### Name: simMPRM
### Title: simulate data according to MPRM
### Aliases: simMPRM
### Keywords: Rasch model multidimensional polytomous simulation

### ** Examples


#set item parameters
item_p <- rbind(matrix(c(-1.5,0.5,0.5,1,0.8,-0.3, 0.2,-1.2), ncol=4),0)

#number of persons
pn <- 500

#simulate data set
simdatM <- simMPRM(item_p, pn)




