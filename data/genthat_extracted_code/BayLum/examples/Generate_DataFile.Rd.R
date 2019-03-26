library(BayLum)


### Name: Generate_DataFile
### Title: Generates, from one (or several) BIN-file(s) of Single-grain OSL
###   measurements, a list of luminescence data and information before
###   statistical analysis
### Aliases: Generate_DataFile

### ** Examples

## Example for one sample with one Bin File
path<- system.file("extdata/samp1", "", package="BayLum")
folder=""
nbsample=1  # give the number of sample
Data <- Generate_DataFile(
 Path = path,
 FolderNames = folder,
 Nb_sample = nbsample,
 verbose = FALSE)
str(Data)

## to save information in RData object in folder containing bin file
# save(Data,file=c(paste(path,folder,'Data.RData',sep="")))
## to load information containing Data.RData object
# load(file=c(paste(path,folder,"Data.RData",sep="")))




