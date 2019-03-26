library(FishResp)


### Name: pyroscience.aquaresp
### Title: Convert Respirometry Data from PyroScience and AquaResp Software
###   to the FishResp Format
### Aliases: pyroscience.aquaresp

### ** Examples


pyroscience.path = system.file("extdata/pyroscience/pyroscience.txt",
                 package = "FishResp")
aquaresp.path = system.file("extdata/pyroscience/pyroscience-aquaresp.txt",
                 package = "FishResp")

pyroscience.aquaresp(pyroscience.file = pyroscience.path,
                     aquaresp.file = aquaresp.path,
                     fishresp.file = "fishresp.txt",
                     date.format = "MDY",
                     n.chamber = 1,
                     wait.phase = 120,
                     measure.phase = 600)




