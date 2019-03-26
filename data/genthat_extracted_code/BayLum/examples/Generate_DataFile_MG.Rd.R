library(BayLum)


### Name: Generate_DataFile_MG
### Title: Generates, from one (or several) BIN file(s) of Multi-grain OSL
###   measurements, a list of luminescence data and information before
###   statistical analysis
### Aliases: Generate_DataFile_MG

### ** Examples

path<- system.file("extdata/FER1", "", package="BayLum")
folder=""
# give the number of sample
nbsample=1
DATA=Generate_DataFile_MG(Path=path,FolderNames=folder,Nb_sample=nbsample)
str(DATA)

# to save information in RData object in folder containing bin file
#save(DATA,file=c(paste(path,folder,'DATA.RData',sep="")))
# to load information containing DATA.RData object
#load(file=c(paste(path,folder,"DATA.RData",sep="")))




