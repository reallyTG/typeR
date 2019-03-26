library(PATHChange)


### Name: PATHChangeList
### Title: PATHChangeList
### Aliases: PATHChangeList

### ** Examples

# For Ontocancro pathways, you can download a file with all pathways from 
# http://ontocancro.inf.ufsm.br/download/BigPathways.zip

filePathway<-system.file("extdata", "BigPathways.txt", package = "PATHChange")

PATHChangeList(filePathway = filePathway, writeRDS = FALSE)
require(rlist)
path <- list.load(file.path(tempdir(),"path.rds"))



