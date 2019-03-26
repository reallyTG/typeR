library(sequoia)


### Name: sequoia
### Title: Pedigree Reconstruction
### Aliases: sequoia

### ** Examples

data(SimGeno_example, LH_HSg5, package="sequoia")
head(SimGeno_example[,1:10])
head(LH_HSg5)
SeqOUT <- sequoia(GenoM = SimGeno_example,
                  LifeHistData = LH_HSg5, MaxSibIter = 0)
names(SeqOUT)
SeqOUT$PedigreePar[34:42, ]
## Not run: 
##D SeqOUT2 <- sequoia(GenoM = SimGeno_example,
##D                   LifeHistData = LH_HSg5, MaxSibIter = 10)
##D SeqOUT2$Pedigree[34:42, ]
##D 
##D # reading in data from text files:
##D GenoM <- as.matrix(read.table("MyGenoData.txt", row.names=1, header=FALSE))
##D LH <- read.table("MyLifeHistData.txt", header=TRUE)
##D MySeqOUT <- sequoia(GenoM = GenoM, LifeHistData = LH)
## End(Not run)



