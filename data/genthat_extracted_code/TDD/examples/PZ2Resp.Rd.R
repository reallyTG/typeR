library(TDD)


### Name: PZ2Resp
### Title: Calculate Instrument Response from Poles/Zeros
### Aliases: PZ2Resp
### Keywords: misc

### ** Examples

# Response of Guralp CMG-40T

PZ = GetPZ(12)[[1]]

f = (1:10000 - 1)/1000

PZ2Resp(PZ, f)



