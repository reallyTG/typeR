library(tis)


### Name: start.tis
### Title: Starting and ending time indexes
### Aliases: start.tis start<- end.tis
### Keywords: ts

### ** Examples

x <- tis(numeric(8), start = c(2001, 1), freq = 4)
start(x)           ## --> ti object representing 2001Q1
start(as.ts(x))    ## --> c(2001, 1)



