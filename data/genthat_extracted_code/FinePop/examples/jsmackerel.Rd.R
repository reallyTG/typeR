library(FinePop)


### Name: jsmackerel
### Title: An example dataset of Japanese Spanich mackerel in GENEPOP and
###   frequency format.
### Aliases: jsmackerel
### Keywords: datasets

### ** Examples

data(jsmackerel)
cat(jsmackerel$MS.genepop, file="JSM_MS_genepop.txt", sep="\n")
cat(jsmackerel$MS.freq, file="JSM_MS_freq.txt", sep="\n")
cat(jsmackerel$mtDNA.freq, file="JSM_mtDNA_freq.txt", sep="\n")
cat(jsmackerel$popname, file="JSM_popname.txt", sep=" ")

# See four text files in your working directory.
#  JSM_MS_genepop.txt  : GENEPOP format file of microsatellite data
#  JSM_MS_freq.txt     : frequency format file of microsatellite data
#  JSM_mtDNA_freq.txt  : frequency format file of mtDNA D-loop region data
#  JSM_popname.txt     : plain text file of subpopulation names



