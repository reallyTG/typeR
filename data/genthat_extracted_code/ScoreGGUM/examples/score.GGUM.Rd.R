library(ScoreGGUM)


### Name: score.GGUM
### Title: Score Persons Using the Generalized Graded Unfolding Model
### Aliases: score.GGUM

### ** Examples

# File path to GGUM2004 item parameter output file 
ex1.pars <- system.file("extdata", "ex1_pars.txt", package="ScoreGGUM")
# File path to binary or graded disagree-agree responses
ex1.data <- system.file("extdata", "ex1_data.txt", package="ScoreGGUM")
# Specify number of response categories per item
numCats.1 <- c(rep(4,3),3,rep(4,19)) 
# Read GGUM2004 item parameter output file into R
itemPars.1 <- read.GGUM(ex1.pars, 23, numCats.1, model=8)
# Name output file in which EAP scores will be saved
outfile.1 <- "EAP_est1.txt"
# Load response data
respData.1 <- as.matrix(read.table(ex1.data,sep=" ",quote="",header=TRUE))
# Specify vector of persons to be removed
removePersons.1 <- c(11,22)
# Obtain EAP estimates and associated standard errors
scores.1 <- score.GGUM(itemPars.1,respData.1,numCats.1,recode=TRUE,
                        removePersons=removePersons.1,outFile=outfile.1)



