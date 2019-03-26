library(magclass)


### Name: dimReduce
### Title: dimReduce
### Aliases: dimReduce

### ** Examples


 #create data with 5 identical scenarios
 p <- add_dimension(population_magpie,nm = paste0("scen",1:5))
 p
 dimReduce(p)
 
 #set years to same value
 p[,,] <- setYears(p[,1,], NULL)
 p
 dimReduce(p)
 
 #set regions to same value
 p[,,] <- setCells(p[1,,], "GLO")
 p
 dimReduce(p)




