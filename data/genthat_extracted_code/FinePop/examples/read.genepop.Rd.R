library(FinePop)


### Name: read.genepop
### Title: Create a genotype data object of populations from a GENEPOP
###   format file.
### Aliases: read.genepop

### ** Examples

# Example of GENEPOP file
data(jsmackerel)
cat(jsmackerel$MS.genepop, file="JSM_MS_genepop.txt", sep="\n")
cat(jsmackerel$popname, file="JSM_popname.txt", sep=" ")

# Read GENEPOP file with subpopulation names
# Prepare your GENEPOP file and population name file in the working directory
# (Here, these files were provided as "JSM_MS_genepop.txt" and "JSM_popname.txt".)
popdata <- read.genepop(genepop="JSM_MS_genepop.txt", popname="JSM_popname.txt")

# Read GENEPOP file without subpopulation names
popdata.noname <- read.genepop(genepop="JSM_MS_genepop.txt")



