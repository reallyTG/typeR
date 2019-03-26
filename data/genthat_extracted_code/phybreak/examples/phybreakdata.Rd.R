library(phybreak)


### Name: phybreakdata
### Title: Create a phybreakdata-object from raw data.
### Aliases: phybreakdata

### ** Examples

sampletimedata <- c(0,2,2,4,4)
sampleSNPdata <- matrix(c("a","a","a","a","a",
                          "a","c","c","c","c",
                          "t","t","t","g","g"), nrow = 5, 
                          dimnames = list(LETTERS[1:5], NULL))
dataset <- phybreakdata(sequences = sampleSNPdata, sample.times = sampletimedata)



