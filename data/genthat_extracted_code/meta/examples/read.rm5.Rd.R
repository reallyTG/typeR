library(meta)


### Name: read.rm5
### Title: Import RevMan 5 data files (.csv)
### Aliases: read.rm5 Fleiss93_CR
### Keywords: datagen

### ** Examples

# Locate export data file "Fleiss93_CR.csv"
# in sub-directory of package "meta"
#
filename <- system.file("data/Fleiss93_CR.csv.gz", package = "meta")
#
Fleiss93_CR <- read.rm5(filename)

# Same result as R command example(Fleiss93):
#
metacr(Fleiss93_CR)

# Same result as R command example(Fleiss93cont):
#
metacr(Fleiss93_CR, 1, 2)



