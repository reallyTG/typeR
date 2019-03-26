library(geoSpectral)


### Name: Spectra
### Title: Constructor function for the class 'Spectra'.
### Aliases: Spectra

### ** Examples

fnm = file.path(base::system.file(package = "geoSpectral"),
"test_data","particulate_absorption.csv.gz")
fnm=gsub("\\\\", "/", fnm)
abs = read.table(fnm,sep=",",header=TRUE)
abs$STATION=factor(abs$STATION)
abs[1:2,1:17] #Display only the first 2 rows and first 17 columns if the data frame
lbd = as.numeric(gsub("X","",colnames(abs)[14:514]))
Units="1/m"
colnames(abs)= gsub("X",paste("anap","_",sep=""), colnames(abs))
colnames(abs)= gsub("PRES","DEPTH", colnames(abs))
abs = abs[,c(14:514,1:13)] #Rearrange so that Spectra columns come first
tz<-strsplit(as.character(abs$TIME)," ")[[1]][[3]] #Extract the timezone
abs$TIME = as.POSIXct(as.character(abs$TIME),tz=tz) #Compute the time

#Space and time columns are automatically found in the column names of inDF
myS<-Spectra(abs,Wavelengths=lbd,Units=Units,ShortName="a_nap")

#Space and time columns are explicitly chosen from inDF columns
myS<-Spectra(abs,Wavelengths=lbd, space=c("LONG","LAT"), time="TIME",
Units=Units,ShortName="a_nap")




