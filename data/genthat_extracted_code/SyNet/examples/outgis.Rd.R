library(SyNet)


### Name: outgis
### Title: Generate a TXT File with Marked Set of Points
### Aliases: outgis
### Keywords: file

### ** Examples

  #This example is driven by a new idea of a sympatry network partitioning.
  #We will implement an algorithm based on the cliques found on the network and 
  #we will export the final classification into a txt file with fields separated by commas. 
  #######
  #Step 1: Infer the network of co-extensive sympatry in the Sciobius example:  
  data(sciobius2x2)
  aux <- gridinfer(dntable = sciobius2x2)
  #######
  #Step 2: Obtain the cliques
  cliques <- netproperties(aux$sm)$Cliques
  #######
  #Step 3: Perform the new alogrithm on the data frame of cliques (1/0 table of species
  #by cliques). Here, the maximum clique is selected and its members removed from the 
  #data frame. This task is repeated until no residual group can be extracted. 
  inc <- apply(cliques, 1, sum) #Number of cliques where a given species occurs
  flag <- sum(cliques)  
  i <- 1 #counter
  classes <- rep(NA, nrow(aux$sm))
  while(flag > 0){
    size <- apply(cliques, 2, sum) #Size of each clique
    clsel <- which.max(size) #Identify a single largest clique  
    members <- which(cliques[,clsel]==1)
    flag <- flag - sum(inc[members])
    inc[members] <- 0
    cliques[members,] <- 0 #Indirect way for removing species already classified
    classes[members] <- paste("Group_", i) 
    i <- i + 1
  }
  split(aux$Label, classes) #Print on R console the resulting partition
  #######
  #Step 3: Create an object of class nampartition by hand and . 
  rslt <- c()
  rslt$kind <- "grids"
  rslt$status <- cbind(Taxa = aux$Label, Status = classes)
  rslt$occupancy <- aux$occupancy
  #Next, set coordinates in function of the geographical centre for each cell used in the 
  #Sciobius' example
  rslt$coords <-  matrix(c(14, -20),  nrow = nrow(aux$coords), ncol = 2, byrow = TRUE) + 
                  matrix(c(2, -2), nrow = nrow(aux$coords), ncol = 2, byrow = TRUE)*aux$coords  
  class(rslt) <- "nampartition"
  #######
  #Step 4: Create the txt file which is easily converted in to a shapefile 
  #by any professional GIS software.
  ## Not run: 
##D   outgis(rslt)
##D   
## End(Not run) 



