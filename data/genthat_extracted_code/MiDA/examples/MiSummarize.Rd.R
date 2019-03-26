library(MiDA)


### Name: MiSummarize
### Title: Microarray data summarization
### Aliases: MiSummarize

### ** Examples

data("IMexpression") # load data
# See 5 zonds to AGTR2.NM_000686
IMexpression [1:10, 1:5]
SumMatrix<-MiSummarize(IMexpression, sep=".")
# now there is median expression for AGTR2.NM_000686
SumMatrix[ 1:10, 1:5]




