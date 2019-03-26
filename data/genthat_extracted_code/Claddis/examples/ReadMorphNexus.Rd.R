library(Claddis)


### Name: ReadMorphNexus
### Title: Reads in a morphological #NEXUS data file
### Aliases: ReadMorphNexus
### Keywords: NEXUS

### ** Examples


# Create example matrix (NB: creates a file in the current
# working directory called "morphmatrix.nex"):
cat("#NEXUS\n\nBEGIN DATA;\n\tDIMENSIONS  NTAX=5 NCHAR=5;\n\t
FORMAT SYMBOLS= \" 0 1 2\" MISSING=? GAP=- ;\nMATRIX\n\n
Taxon_1  010?0\nTaxon_2  021?0\nTaxon_3  02111\nTaxon_4  011-1
\nTaxon_5  001-1\n;\nEND;\n\nBEGIN ASSUMPTIONS;\n\t
OPTIONS  DEFTYPE=unord PolyTcount=MINSTEPS ;\n\t
TYPESET * UNTITLED  = unord: 1 3-5, ord: 2;\n\t
WTSET * UNTITLED  = 1: 2, 2: 1 3-5;\nEND;", file = "morphmatrix.nex")

# Read in example matrix:
morph.matrix <- ReadMorphNexus("morphmatrix.nex")

# View example matrix in R:
morph.matrix

# Remove the generated data set:
file.remove("morphmatrix.nex")




