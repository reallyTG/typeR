library(rLakeAnalyzer)


### Name: get.offsets
### Title: Gets depths from data frame containing profile info.
### Aliases: get.offsets
### Keywords: manip

### ** Examples



#Get the path for the package example file included
exampleFilePath <- system.file('extdata', 'Sparkling.wtr', package="rLakeAnalyzer")

#Load
sparkling.temp = load.ts(exampleFilePath)

#get the lake depths associated with each column
depths = get.offsets(sparkling.temp)

print(depths)



