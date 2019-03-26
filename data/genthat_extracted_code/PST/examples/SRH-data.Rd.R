library(PST)


### Name: SRH
### Title: Longitudinal data on self rated health
### Aliases: SRH SRH.seq
### Keywords: datasets

### ** Examples

## Preparing a sequence object with the SRH data set
data(SRH)

## Long state labels
state.list <- levels(SRH$p99c01)

## Sequential color palette
mycol5 <- rev(brewer.pal(5, "RdYlGn"))

## Creating the sequence object
SRH.seq <- seqdef(SRH, 5:15, alphabet=state.list, 
	states=c("G1", "G2", "M", "B2", "B1"), labels=state.list, 
	weights=SRH$wp09lp1s, right=NA, cpal=mycol5)
names(SRH.seq) <- 1999:2009



