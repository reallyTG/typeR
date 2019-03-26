library(pcIRT)


### Name: simDRM
### Title: simulate data according to Rasch model
### Aliases: simDRM
### Keywords: Rasch model simulation

### ** Examples


#set item parameters
item_p <- c(-1.5,-0.3,0,0.3,1.5)

#number of persons
pn <- 500

#simulate data set
simdatD <- simDRM(item_p, pn)




