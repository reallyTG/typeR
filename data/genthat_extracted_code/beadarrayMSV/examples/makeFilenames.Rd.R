library(beadarrayMSV)


### Name: makeFilenames
### Title: Generate filenames reflecting normalizations
### Aliases: makeFilenames modifyExistingFilenames

### ** Examples

#Create names
normOpts <- setNormOptions()
tag <- '1'
dataFiles <- makeFilenames(tag,normOpts)
print(dataFiles)

#Make new names for subsequent, alternate genotype calling runs
dataFiles <- modifyExistingFilenames(dataFiles,tag,'2')



