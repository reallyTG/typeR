library(TDD)


### Name: PlotResp
### Title: Plot Instrument Responses
### Aliases: PlotResp
### Keywords: misc

### ** Examples

# Response of Guralp CMG-40T

PZ = GetPZ(12)[[1]]
DPZ = GetDPZ(12, 1)[[1]]
PlotResp(PZ, DPZ, fmin = 1/50)



