library(meta)


### Name: metacr
### Title: Meta-analysis of outcome data from Cochrane review
### Aliases: metacr
### Keywords: htest

### ** Examples

# Locate export data file "Fleiss93_CR.csv"
# in sub-directory of package "meta"
#
filename <- system.file("data/Fleiss93_CR.csv.gz", package = "meta")
#
Fleiss93_CR <- read.rm5(filename)

# Choose RevMan 5 settings and store old settings
#
oldset <- settings.meta("revman5")

# Same result as R command example(Fleiss93):
#
metacr(Fleiss93_CR)

# Same result as R command example(Fleiss93cont):
#
metacr(Fleiss93_CR, 1, 2)

forest(metacr(Fleiss93_CR, 1, 2))

# Change summary measure to RR
#
m1 <- metacr(Fleiss93_CR)
update(m1, sm="RR")

# Use old settings
#
settings.meta(oldset)



