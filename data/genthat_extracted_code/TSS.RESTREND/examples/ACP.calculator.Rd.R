library(TSS.RESTREND)


### Name: ACP.calculator
### Title: Antecedental Rainfall (and temperature) Accumulation calculator
###   for the VI Complete Time Series
### Aliases: ACP.calculator

### ** Examples

#Find the data
vi.path <- system.file("extdata", "rabbitVI.csv", package = "TSS.RESTREND", mustWork = TRUE)
in.VI <- read.csv(vi.path)
CTSR.VI <- ts(in.VI, start=c(1982, 1), end=c(2013,12), frequency = 12)
data(rabbitACPtable)
ACPres <- ACP.calculator(CTSR.VI, rabbitACPtable)
print(ACPres$summary)



