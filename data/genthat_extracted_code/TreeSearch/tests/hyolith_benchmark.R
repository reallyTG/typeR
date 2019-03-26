unload()
install(args='--no-multiarch')
set.seed(0)
library('ape'); library('phangorn'); library('TreeSearch');

source('../hyoliths/helperFunctions.R')
source('../hyoliths/plotFunctions.R')

files <- list.files(path='../hyoliths/', pattern='mbank_.*\\.nex', full.names=TRUE)
filename <- files[which.max(vapply(files, NexusTime, double(1)))]
my_data <- ReadAsPhyDat(filename)
ignored_taxa <- c('Conotheca', 'Decoritheca', 'Maxilites', 'Pauxillites',
                  'Probactrotheca', 'Serpula', 'Sipunculus', 
                  'Loxosomella', 'Tonicella', 'Dentalium', 'Botsfordia')
outgroup <- 'Flustra'
my_data[ignored_taxa] <- NULL
nj.tree <- NJTree(my_data)
rooted.tree <- EnforceOutgroup(nj.tree, outgroup)
start.tree <- TreeSearch(tree=rooted.tree, dataset=my_data, maxIter=3000,
                         EdgeSwapper=RootedNNISwap, verbosity=0)

Rprof()
tree1 <- Ratchet(start.tree, my_data, verbosity=1L,
                   ratchHits = 20, searchHits=45, # ratchHits = 10 not enough
                   swappers=list(RootedTBRSwap, RootedSPRSwap, RootedNNISwap, AllTBR))
Rprof(NULL)
results1 <- summaryRprof()
results1


Rprof()
tree2 <- Ratchet(start.tree, my_data, verbosity=1L,
                   ratchHits = 20, searchHits=55, # ratchHits = 10 not enough
                   swappers=list(RootedTBRSwap, RootedSPRSwap, RootedNNISwap))
Rprof(NULL)
results2 <- summaryRprof()
results2

