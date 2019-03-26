library(meta)


### Name: print.rm5
### Title: Print and summary methods for objects of class rm5
### Aliases: print.rm5 print.summary.rm5 summary.rm5 metabias.rm5
### Keywords: print

### ** Examples

# Locate export data file "Fleiss93_CR.csv"
# in sub-directory of package "meta"
#
filename <- system.file("data/Fleiss93_CR.csv.gz", package = "meta")
#
Fleiss93_CR <- read.rm5(filename)

#
# Print summary results for all meta-analysis:
#
summary(Fleiss93_CR)

#
# Print results for tests of small-study effects:
#
metabias(Fleiss93_CR, k.min=5)



