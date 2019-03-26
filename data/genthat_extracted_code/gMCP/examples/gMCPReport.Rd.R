library(gMCP)


### Name: gMCPReport
### Title: Automatic Generation of gMCP Reports
### Aliases: gMCPReport
### Keywords: IO file graphs print

### ** Examples


g <- BretzEtAl2011()

result <- gMCP(g, pvalues=c(0.1, 0.008, 0.005, 0.15, 0.04, 0.006))

gMCPReport(result)




