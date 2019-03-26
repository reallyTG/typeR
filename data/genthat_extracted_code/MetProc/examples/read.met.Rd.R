library(MetProc)


### Name: read.met
### Title: Read in a Metabolomics Dataset of Standard Structure
### Aliases: read.met

### ** Examples

library(MetProc)

#Read in metabolomics data
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")



