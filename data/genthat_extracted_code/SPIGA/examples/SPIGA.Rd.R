library(SPIGA)


### Name: Drought Index
### Title: Calculation of Standardized Precipitation Index, using the
###   Genetic Algorithm Method (SPIGA) and Maximum Likelihood (SPIML)
### Aliases: SPIGA SPIML

### ** Examples

#### Load data
data(Pm_Pisco)
Pmon<-Pm_Pisco      # dataframe Precipitation
summary(Pm_Pisco)   # view summary
Pmon<-Pm_Pisco[,]

#### Computing SPI with Genetic Algorithms
pob     <-50        # Define population number
iMax    <-10        # Define Max iteration

# Total stations calculation. It may take some time.
#SPIGA(Pmon, scale=3, population=pob, maxIter = iMax, plotGA=TRUE, plotCDF=TRUE)

# station 1 computing
Pmon1<-data.frame(Pmon[,1:2], Pmon$Pm_St1)
SPIGA(Pmon1, scale=3, population=pob, maxIter = iMax)

# station 2 computing
Pmon2<-data.frame(Pmon[,1:2], Pmon$Pm_St2)
SPIGA(Pmon2, scale=3, population=pob, maxIter = iMax)

#### Computing SPI with Maximun Likelihood
SPIML(Pmon, scale=3)



