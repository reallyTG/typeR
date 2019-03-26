library(phybreak)


### Name: phybreak
### Title: Create a phybreak-object from data and prior distributions.
### Aliases: phybreak

### ** Examples

simulation <- sim.phybreak(obsize = 10)
MCMCstate <- phybreak(data = simulation)

simulation <- sim.phybreak(obsize = 10)
MCMCstate <- phybreak(data = simulation, use.tree = TRUE)


sampletimedata <- c(0,2,2,4,4)
sampleSNPdata <- matrix(c("a","a","a","a","a",
                          "a","c","c","c","c",
                          "t","t","t","g","g"), nrow = 5)
dataset <- phybreakdata(sequences = sampleSNPdata, sample.times = sampletimedata)
MCMCstate <- phybreak(data = dataset)

### also possible without 'phybreakdata' as intermediate, 
### but not with additional data (future implementation)
MCMCstate <- phybreak(data = sampleSNPdata, times = sampletimedata)



