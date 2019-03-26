library(sidier)


### Name: HapPerPop
### Title: Returns the number of haplotypes per population.
### Aliases: HapPerPop

### ** Examples

cat("Sequence.Name Haplotype.Name",
"Population1 H1",
"Population1 H2",
"Population1 H3",
"Population1 H2",
"Population2 H4",
"Population2 H5",
"Population2 H6",
"Population2 H4",
"Population3 H7",
"Population3 H7",
"Population3 H7",
"Population3 H7",
     file = "3_FindHaplo_Example2_modified.txt", sep = "\n")

# Reading the alignment directly from file:
	HapPerPop(inputFile="3_FindHaplo_Example2_modified.txt",header=TRUE,
saveFile=FALSE)

cat("Sequence.Name Haplotype.Name",
"Population1id1 H1",
"Population1id2 H2",
"Population1id3 H3",
"Population1id4 H2",
"Population2id1 H4",
"Population2id2 H5",
"Population2id3 H6",
"Population2id4 H4",
"Population3id1 H7",
"Population3id2 H7",
"Population3id3 H7",
"Population3id4 H7",
     file = "4_FindHaplo_Example2_modified.txt", sep = "\n")

# Reading the alignment directly from file. First column includes population
# and individual names. Consequently, 12 populations are considered:
	HapPerPop(inputFile="4_FindHaplo_Example2_modified.txt",header=TRUE,
saveFile=FALSE)

# Population names within the input matrix first column goes from 
# character 1 to 11. Now 3 populations are considered:
	HapPerPop(inputFile="4_FindHaplo_Example2_modified.txt",header=TRUE,
saveFile=FALSE,NameIniPopulations=1, NameEndPopulations=11)

# If population names are set from character 1 to 3, all samples would
# be treated as a single population
	HapPerPop(inputFile="4_FindHaplo_Example2_modified.txt",header=TRUE,
saveFile=FALSE,NameIniPopulations=1, NameEndPopulations=3)

# Reading the alignment directly from file, displaying only the 
# weighted matrix:
	HapPerPop(inputFile="4_FindHaplo_Example2_modified.txt",header=TRUE,
saveFile=FALSE,NameIniPopulations=1, NameEndPopulations=11)[[1]]

# Reading the alignment from an object and saving the two computed
# distance matrices:
	FH<-read.table("3_FindHaplo_Example2_modified.txt",header=TRUE)
	HapPerPop(input=FH,header=TRUE,saveFile=FALSE)




