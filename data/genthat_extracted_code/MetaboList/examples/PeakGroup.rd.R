library(MetaboList)


### Name: PeakGroup
### Title: Peak Grouping for multiple DIA files
### Aliases: PeakGroup

### ** Examples

library(MetaboList)
#Reading the file.mzXML for Full-MS scan and MS/MS.
#The files were previously separated with the SEPC.R function.

#fileMS<-"fullMS.mzXML"
#fileMS2CE5<-"fileMS2CE5.mzXML"

# Separation by collision energy
#CE.isolation("AIFpos1000-AIF.mzXML","fileposB")

#Reading the database.csv file:
# database<- read.csv("C:/database.csv")

#Processing peak-picking and annotation with default parameters

#aif5<-AIF(fileMS,fileMS2CE5,databasepos,CE=5,
#ion_mode = "positive",mzw = 0.005,rtw = 7
#,minintMS2=1,minintMS1=1)
#aif10<-AIF(fileMS,fileMS2CE10,databasepos,CE=10,
#ion_mode = "positive",rtw = 7, mzw = 0.005
#,minintMS2=1,minintMS1=1)
#aif20<-AIF(fileMS,fileMS2CE20,databasepos, CE=20,
#ion_mode = "positive",rtw = 7, mzw = 0.005,
#minintMS2=1,minintMS1=1)

# Peak grouping

#Peakgroup<-PeakGroup(aif5,aif10,aif20)





