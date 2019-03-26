library(ProfessR)


### Name: DUPbank
### Title: Find Duplicate Questions
### Aliases: DUPbank
### Keywords: misc

### ** Examples

data(QBANK1)

###  force some questions to be duplicates:
QBANK1[[51]]=QBANK1[[25]]
QBANK1[[52]]=QBANK1[[12]]
QBANK1[[14]]=QBANK1[[4]]


DQ = DUPbank(QBANK1)

DQ



