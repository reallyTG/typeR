library(apex)


### Name: read.multidna
### Title: Read multiple DNA alignments
### Aliases: read.multidna read.multiFASTA read.multiphyDat

### ** Examples

## get path to the files
files <- dir(system.file(package="apex"),patter="patr", full=TRUE)
files

## read files
x <- read.multiFASTA(files)
x
plot(x)

y <- read.multiphyDat(files, format="fasta")
y




