library(paleotree)


### Name: taxonSortPBDBocc
### Title: Sorting Unique Taxa of a Given Rank from Paleobiology Database
###   Occurrence Data
### Aliases: taxonSortPBDBocc

### ** Examples

#load example graptolite PBDB occ dataset
data(graptPBDB)

#get formal genera
occGenus <- taxonSortPBDBocc(graptOccPBDB, rank = "genus")
length(occGenus)

#get formal species
occSpeciesFormal <- taxonSortPBDBocc(graptOccPBDB, rank = "species")
length(occSpeciesFormal)

#yes, there are fewer 'formal' graptolite species in the PBDB then genera

#get formal and informal species
occSpeciesInformal <- taxonSortPBDBocc(graptOccPBDB, rank = "species",
	 onlyFormal = FALSE)
length(occSpeciesInformal)

#way more graptolite species are 'informal' in the PBDB

#get formal and informal species 
	#including from occurrences with uncertain taxonomy
	#basically everything and the kitchen sink
occSpeciesEverything <- taxonSortPBDBocc(graptOccPBDB, rank = "species",
		onlyFormal = FALSE, cleanUncertain = FALSE)
length(occSpeciesEverything)

## Not run: 
##D 
##D # simple function for getting occurrence data from API v1.1 
##D easyGetPBDBocc <- function(taxa,show = c("ident","phylo")){
##D   #cleans PBDB occurrence downloads of warnings
##D   taxa <- paste(taxa,collapse = ",")
##D 	taxa <- paste(unlist(strsplit(taxa,"_")),collapse = "%20")
##D 	show <- paste(show,collapse = ",")
##D 	command <- paste0("http://paleobiodb.org/data1.2/occs/list.txt?base_name = ",
##D 		taxa,"&show = ",show,"&limit = all",
##D 		collapse = "")
##D 	command <- paste(unlist(strsplit(command,split = " ")),collapse = "%20")
##D 	downData <- readLines(command)
##D 	if(length(grep("Warning",downData)) != 0){
##D 		start <- grep("Records",downData)
##D 		warn <- downData[1:(start-1)]
##D 		warn <- sapply(warn, function(x) 
##D 			paste0(unlist(strsplit(unlist(strsplit(x,'"')),",")),collapse = ""))
##D 		warn <- paste0(warn,collapse = "\n")
##D 		names(warn) <- NULL
##D 		mat <- downData[-(1:start)]
##D 		mat <- read.csv(textConnection(mat))
##D 		message(warn)
##D 	}else{
##D 		mat <- downData
##D 		mat <- read.csv(textConnection(mat))
##D 		}
##D 	return(mat)
##D 	}
##D 
##D #try a PBDB API download with lots of synonymization
##D 	#this should have only 1 species
##D #old way:
##D #acoData <- read.csv(paste0("http://paleobiodb.org/data1.1/occs/list.txt?",
##D #	"base_name = Acosarina%20minuta&show = ident,phylo&limit = all"))
##D # with easyGetPBDBocc:
##D acoData <- easyGetPBDBocc("Acosarina minuta")
##D x <- taxonSortPBDBocc(acoData, rank = "species", onlyFormal = FALSE)
##D names(x)
##D 
##D #make sure works with API v1.1
##D dicelloData <- read.csv(paste0("http://paleobiodb.org",
##D 	"/data1.1/occs/list.txt?base_name = Dicellograptus",
##D 	"&show = ident,phylo&limit = all"))
##D dicelloOcc2 <- taxonSortPBDBocc(dicelloData, rank = "species", onlyFormal = FALSE)
##D names(dicelloOcc2)
##D 
##D #make sure works with compact vocab v1.1
##D dicelloData <- read.csv(paste0("http://paleobiodb.org",
##D 	"/data1.1/occs/list.txt?base_name = Dicellograptus",
##D 	"&show = ident,phylo&limit = all&vocab = com"))
##D dicelloOccCom1 <- taxonSortPBDBocc(dicelloData, rank = "species", onlyFormal = FALSE)
##D names(dicelloOccCom1)
##D head(dicelloOccCom1[[1]])[,1:7]
##D 
##D #make sure works with compact vocab v1.2
##D dicelloData <- read.csv(paste0("http://paleobiodb.org",
##D 	"/data1.2/occs/list.txt?base_name = Dicellograptus",
##D 	"&show = ident,phylo&limit = all&vocab = com"))
##D dicelloOccCom1 <- taxonSortPBDBocc(dicelloData, rank = "species", onlyFormal = FALSE)
##D names(dicelloOccCom1)
##D head(dicelloOccCom1[[1]])[,1:7]
##D 
## End(Not run)




