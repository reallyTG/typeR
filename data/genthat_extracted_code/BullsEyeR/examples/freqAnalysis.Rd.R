library(BullsEyeR)


### Name: freqAnalysis
### Title: Functions Frequency Analysis
### Aliases: freqAnalysis

### ** Examples

## Not run: 
##D # Run it and see for yourself
## End(Not run)
data.tmp<-read.csv(system.file("ext", "testdata.csv", package="BullsEyeR"))
ds<-as.character(data.tmp$Story[1:2])
freqAnalysis(ds=ds,spvar=0.99,stemvar=0)



