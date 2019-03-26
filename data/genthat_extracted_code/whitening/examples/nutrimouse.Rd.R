library(whitening)


### Name: nutrimouse
### Title: Nutrimouse Data
### Aliases: nutrimouse
### Keywords: datasets

### ** Examples

# load whitening library
library("whitening")

# load nutrimouse data set
data(nutrimouse)

dim(nutrimouse$gene) # 40 120
dim(nutrimouse$lipid) # 40 21
levels( nutrimouse$diet ) #  "coc"  "fish" "lin"  "ref"  "sun"
levels( nutrimouse$genotype ) # "wt"   "ppar"



