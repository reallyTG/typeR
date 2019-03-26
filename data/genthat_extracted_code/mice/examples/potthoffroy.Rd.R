library(mice)


### Name: potthoffroy
### Title: Potthoff-Roy data
### Aliases: potthoffroy
### Keywords: datasets

### ** Examples



### create missing values at age 10 as in Little and Rubin (1987)

phr <- potthoffroy
idmis <- c(3,6,9,10,13,16,23,24,27)
phr[idmis, 4] <- NA
phr

md.pattern(phr)





