library(geoSpectral)


### Name: subset,Spectra-method
### Title: Subsetting for a 'Spectra' and spcList classes
### Aliases: subset,Spectra-method

### ** Examples

fnm = file.path(system.file(package = "geoSpectral"), "test_data","particulate_absorption.csv.gz")
abs = read.table(fnm,sep=",",header=TRUE)
abs$STATION=factor(abs$STATION)
abs[1:2,1:17] #Display only the first 2 rows and first 17 columns if the data frame
lbd = as.numeric(gsub("X","",colnames(abs)[14:514]))
Units="1/m"
colnames(abs)= gsub("X",paste("anap","_",sep=""), colnames(abs))
colnames(abs)= gsub("PRES","DEPTH", colnames(abs))
abs = abs[,c(14:514,1:13)]
tz<-strsplit(as.character(abs$TIME)," ")[[1]][[3]] #Extract the timezone
abs$TIME = as.POSIXct(as.character(abs$TIME),tz=tz) 
myS<-Spectra(abs,Wavelengths=lbd,Units=Units,ShortName="a_nap")
myS
head(spc.getwavelengths(myS))
spc.setwavelengths(myS) <- 300:800 
myS[1:10]
myS[,"anap_400"] 
myS[,c("anap_400","anap_500")] 
myS[1:10,30:50] #Selection of channels by column index
lbd = as.numeric(c(412,440,490,555,670))
myS[1:10,lbd] #Selection of channels by wavelength
myS[1:10,"415::450"] 
myS$CAST #Returns Ancillary data
myS$anap_400 #Returns spectra as numeric vector
head(myS[["anap_400"]]) #Returns spectra as numeric vector
head(myS[[c("Snap","Offset")]]) #Returns data.frame
#Subsetting rows with respect to the value of Ancillary data
subset(myS,DEPTH<=30)
#Subsetting rows with respect to the value of Spectral data
subset(myS,anap_440<=0.01)
#Selecting Ancillary data columns, leaving Spectral columns intact
subset(myS,subset=DEPTH<=30,select="CAST") 




