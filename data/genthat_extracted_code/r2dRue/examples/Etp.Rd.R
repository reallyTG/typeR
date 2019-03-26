library(r2dRue)


### Name: petHgsm
### Title: Computes Potential Evapo-Transpiration (PET)
### Aliases: batchPetHgsm petHgsm

### ** Examples

#not run
## Read  the temperature and radiation data 
#tmin=readGDAL('Tmin_Ene1990')
#tmax=readGDAL('Tmax_Ene1990')
#tmea=readGDAL('Tmea_Ene1990')
#rad=readGDAL('SolarRad_Ene1990')
## Calc the PET for Ene 1990
#PetEne=petHgsm(tmin,tmax,tmea,rad, 1)
#writeGDAL(PetEne,'PetEne1990')
## Or to calculate and write to disk, in a batch process, a set of PETs
## create the Input file list
#Flmin=c('Tmin_Ene1990','Tmin_Feb1990', 'Tmin_Mar1990')
#Flmax=c('Tmax_Ene1990','Tmax_Feb1990', 'Tmax_Mar1990')
#Flmea=c('Tmea_Ene1990','Tmea_Feb1990', 'Tmea_Mar1990')
#Flrad=c('Rad_Ene','Rad_Feb', 'Rad_Mar')
#PETFileNames=c('PET_Ene1990','PET_Feb1990', 'PET_Mar1990')
##define the date of the first image
#iniDate=c(1,1990)
#batchPET(iniDate, Flmin, Flmax, Flmea, Flrad, PETFileNames)




