library(BAMMtools)


### Name: samplingProbs
### Title: Creates clade-specific sampling fractions
### Aliases: samplingProbs

### ** Examples

# Generate dummy data
tree <- read.tree(text="(((t1:2,(t2:1,t3:1):1):1,((t4:1,t5:1):1,t6:2):1)
                  :1,(t7:3,(t8:2,t9:2):1):1);")
tree$tip.label <- paste(rep('Species',9),1:9,sep='')

spTable <- as.data.frame(matrix(nrow=9,ncol=2))
spTable[,1] <- tree$tip.label
spTable[1:3,2] <- 'cladeA'
spTable[4:6,2] <- 'cladeB'
spTable[7:9,2] <- 'cladeC'
richnessVec <- c(cladeA=5, cladeB=4, cladeC=12)

# Option 1: We have a table of clade assignment for the species in the
#           tree, along with a vector of known clade richness
spTable
richnessVec
samplingProbs(tree, cladeTable = spTable, cladeRichness = richnessVec,
              globalSampling = 1, writeToDisk = FALSE)

# Option 2: We have a table of known species, beyond the sampling in the
#           phylogeny
spTable <- rbind(spTable, c('Species10','cladeA'),c('Species11','cladeA'),
                 c('Species12','cladeC'), c('Species13','cladeC'),
                 c('Species14','cladeC'))

spTable

samplingProbs(tree, cladeTable = spTable, cladeRichness = NULL, 
              globalSampling = 0.9, writeToDisk = FALSE)



