library(micropan)


### Name: mpneumoniae
### Title: Data sets for the _Mycoplasma pneumoniae_ casestudy
### Aliases: mpneumoniae Mpneumoniae Mpneumoniae.table
###   Mpneumoniae.blast.distances Mpneumoniae.blast.clustering
###   Mpneumoniae.blast.panmat Mpneumoniae.domain.clustering
###   Mpneumoniae.domain.panmat

### ** Examples

# Genome overview table
data(Mpneumoniae.table) #loads the Mpneumoniae.table
if(interactive()){
   View(Mpneumoniae.table)
} else {
   str(Mpneumoniae.table)
}

# BLAST distances, only the first 20 are displayed
data(Mpneumoniae.blast.distances) #loads the Mpneumoniae.blast.distances
if(interactive()){
   View(Mpneumoniae.blast.distances[1:20,])
} else {
   str(Mpneumoniae.blast.distances[1:20,])
}

# BLAST clustering vector
data(Mpneumoniae.blast.clustering) #loads the Mpneumoniae.blast.clustering
print(Mpneumoniae.blast.clustering[1:30])

# BLAST pan-matrix
data(Mpneumoniae.blast.panmat) #loads the Mpneumoniae.blast.panmat
summary(Mpneumoniae.blast.panmat)

# Domain sequence clustering vector
data(Mpneumoniae.domain.clustering) #loads the Mpneumoniae.domain.clustering
print(Mpneumoniae.domain.clustering[1:30])

# Domain sequence pan-matrix
data(Mpneumoniae.domain.panmat) #loads the Mpneumoniae.domain.panmat
summary(Mpneumoniae.domain.panmat)




