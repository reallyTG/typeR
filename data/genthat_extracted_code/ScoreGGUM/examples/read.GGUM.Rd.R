library(ScoreGGUM)


### Name: read.GGUM
### Title: Read GGUM2004 Item Parameter Output Files
### Aliases: read.GGUM

### ** Examples

# File path to GGUM2004 item parameter output file 
ex1.pars <- system.file("extdata", "ex1_pars.txt", package="ScoreGGUM")
# Specify number of response categories per item
numCats.1 <- c(rep(4,3),3,rep(4,19)) 
# Read GGUM2004 item parameter output file into R
itemPars.1 <- read.GGUM(ex1.pars, 23, numCats.1, model=8)



