library(paleotree)


### Name: makePBDBtaxonTree
### Title: Creating a Taxon-Tree from Taxonomic Data Downloaded from the
###   Paleobiology Database
### Aliases: makePBDBtaxonTree

### ** Examples

## Not run: 
##D 
##D easyGetPBDBtaxa <- function(taxon,show = c("phylo","img","app")){
##D 	#let's get some taxonomic data
##D 	taxaData <- read.csv(paste0("http://paleobiodb.org/",
##D 		"data1.1/taxa/list.txt?base_name = ",taxon,
##D 		"&rel = all_children&show = ",
##D 	paste0(show,collapse = ","),"&status = senior"),
##D 	stringsAsFactors = FALSE)
##D 	return(taxaData)
##D 	}
##D 
##D #graptolites
##D graptData <- easyGetPBDBtaxa("Graptolithina")
##D graptTree <- makePBDBtaxonTree(graptData,"genus",
##D 	method = "parentChild", solveMissing = "queryPBDB")
##D #try Linnean
##D graptTree <- makePBDBtaxonTree(graptData,"genus",
##D 	method = "Linnean")
##D plot(graptTree,show.tip.label = FALSE,no.margin = TRUE,edge.width = 0.35)
##D nodelabels(graptTree$node.label,adj = c(0,1/2))
##D 
##D #conodonts
##D conoData <- easyGetPBDBtaxa("Conodonta")
##D conoTree <- makePBDBtaxonTree(conoData,"genus",
##D 	method = "parentChild", solveMissing = "queryPBDB")
##D plot(conoTree,show.tip.label = FALSE,no.margin = TRUE,edge.width = 0.35)
##D nodelabels(conoTree$node.label,adj = c(0,1/2))
##D 
##D #asaphid trilobites
##D asaData <- easyGetPBDBtaxa("Asaphida")
##D asaTree <- makePBDBtaxonTree(asaData,"genus",
##D 	method = "parentChild", solveMissing = "queryPBDB")
##D plot(asaTree,show.tip.label = FALSE,no.margin = TRUE,edge.width = 0.35)
##D nodelabels(asaTree$node.label,adj = c(0,1/2))
##D 
##D #Ornithischia
##D ornithData <- easyGetPBDBtaxa("Ornithischia")
##D ornithTree <- makePBDBtaxonTree(ornithData,"genus",
##D 	method = "parentChild", solveMissing = "queryPBDB")
##D #try Linnean
##D #need to drop repeated taxon first: Hylaeosaurus
##D ornithData <- ornithData[-(which(ornithData[,"taxon_name"] == "Hylaeosaurus")[1]),]
##D ornithTree <- makePBDBtaxonTree(ornithData,"genus",
##D 	method = "Linnean")
##D plot(ornithTree,show.tip.label = FALSE,no.margin = TRUE,edge.width = 0.35)
##D nodelabels(ornithTree$node.label,adj = c(0,1/2))
##D 
##D #Rhynchonellida
##D rynchData <- easyGetPBDBtaxa("Rhynchonellida")
##D rynchTree <- makePBDBtaxonTree(rynchData,"genus",
##D 	method = "parentChild", solveMissing = "queryPBDB")
##D plot(rynchTree,show.tip.label = FALSE,no.margin = TRUE,edge.width = 0.35)
##D nodelabels(rynchTree$node.label,adj = c(0,1/2))
##D 
##D #some of these look pretty messy!
##D 
## End(Not run)

###################################
## No test: 

#let's try time-scaling the graptolite tree

#get some example occurrence and taxonomic data
data(graptPBDB)

#get the taxon tree: Linnean method
graptTree <- makePBDBtaxonTree(graptTaxaPBDB, "genus", method = "Linnean")
plot(graptTree,cex = 0.4)
nodelabels(graptTree$node.label,cex = 0.5)

#get the taxon tree: parentChild method
graptTree <- makePBDBtaxonTree(graptTaxaPBDB, "genus", method = "parentChild")
plot(graptTree,cex = 0.4)
nodelabels(graptTree$node.label,cex = 0.5)

#get time data from occurrences
graptOccGenus <- taxonSortPBDBocc(graptOccPBDB,rank = "genus",onlyFormal = FALSE)
graptTimeGenus <- occData2timeList(occList = graptOccGenus)

#let's time-scale the parentChild tree with paleotree
	# use minimum branch length for visualization
		# and nonstoch.bin so we plot maximal ranges
timeTree <- bin_timePaleoPhy(graptTree,timeList = graptTimeGenus,
	nonstoch.bin = TRUE,type = "mbl",vartime = 3)

#drops a lot of taxa; some of this is due to mispellings, etc

## End(No test)
## Not run: 
##D 
##D #make pretty plot with library strap
##D library(strap)
##D geoscalePhylo(timeTree, ages = timeTree$ranges.used)
##D nodelabels(timeTree$node.label,cex = 0.5)
##D 
## End(Not run)




