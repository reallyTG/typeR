library(FinePop)


### Name: herring
### Title: An example dataset of Atlantic herring.
### Aliases: herring
### Keywords: datasets

### ** Examples

data(herring)
cat(herring$genepop, file="AH_genepop.txt", sep="\n")
cat(herring$popname, file="AH_popname.txt", sep=" ")
# See two text files in your working directory.
#  AH_genepop.txt  : GENEPOP format file of 281SNPs in 18 subpopulations
#  AH_popname.txt  : plain text file of subpopulation names

# herring$popdata = read.genepop(genepop="AH_genepop.txt", popname="AH_popname.txt")
# herring$fst.bootstrap = FstBoot(herring$popdata)
# herring$fst.env = FstEnv(herring$fst.bootstrap, herring$environment, herring$distance)



