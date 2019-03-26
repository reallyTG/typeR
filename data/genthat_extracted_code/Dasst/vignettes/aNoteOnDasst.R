### R code from vignette source 'aNoteOnDasst.Rnw'

###################################################
### code chunk number 1: aNoteOnDasst.Rnw:39-40
###################################################
options(continue=" ")


###################################################
### code chunk number 2: aNoteOnDasst.Rnw:44-48
###################################################
library(Dasst)
dssatfile <- system.file("extdata","PlantGro.OUT", 
                         package="Dasst")
plantgro <- read.dssat(dssatfile)


###################################################
### code chunk number 3: aNoteOnDasst.Rnw:54-55
###################################################
data(plantGrowth)


###################################################
### code chunk number 4: aNoteOnDasst.Rnw:60-61
###################################################
length(plantGrowth)


###################################################
### code chunk number 5: aNoteOnDasst.Rnw:68-69
###################################################
summary(plantGrowth)


###################################################
### code chunk number 6: aNoteOnDasst.Rnw:74-75
###################################################
plantGrowth[[1]][1,"YEAR"]


###################################################
### code chunk number 7: aNoteOnDasst.Rnw:80-84
###################################################
nrun <- searchAncillary(plantGrowth, secKey="run[[:space:]]*3", 
                        ignore.case=TRUE)
nrun
getAncillary(plantGrowth, nrun)


###################################################
### code chunk number 8: aNoteOnDasst.Rnw:91-93
###################################################
addDate(plantGrowth) <- ~ YEAR + DOY
plantGrowth[[1]][1:3,c("YEAR","DOY","date_YEAR_DOY")]


###################################################
### code chunk number 9: aNoteOnDasst.Rnw:98-99
###################################################
plot(plantGrowth[[1]][,"date_YEAR_DOY"],plantGrowth[[1]][,"LAID"])


###################################################
### code chunk number 10: aNoteOnDasst.Rnw:104-105
###################################################
plot(plantGrowth[[1]][,"date_YEAR_DOY"],plantGrowth[[1]][,"LAID"])


###################################################
### code chunk number 11: aNoteOnDasst.Rnw:117-121
###################################################
from01to10 <- gatherTables(plantGrowth[1:10], c("DAP"),
                           c("SWAD","LWAD","GWAD"), mean)
lastRow <- nrow(from01to10)
from01to10[(lastRow-5):lastRow,]


###################################################
### code chunk number 12: aNoteOnDasst.Rnw:126-127
###################################################
plot(SWAD + LWAD + GWAD ~ DAP, data=from01to10)


###################################################
### code chunk number 13: aNoteOnDasst.Rnw:132-133
###################################################
plot(SWAD + LWAD + GWAD ~ DAP, data=from01to10)


###################################################
### code chunk number 14: aNoteOnDasst.Rnw:147-150
###################################################
smmyfile <- system.file("extdata", "Summary.OUT", package="Dasst")
smmy <- read.dssat(smmyfile)
summary(smmy)


###################################################
### code chunk number 15: aNoteOnDasst.Rnw:156-157
###################################################
boxplot(HWAM ~ TRNO, data=smmy[[1]])


###################################################
### code chunk number 16: aNoteOnDasst.Rnw:162-163
###################################################
boxplot(HWAM ~ TRNO, data=smmy[[1]])


###################################################
### code chunk number 17: aNoteOnDasst.Rnw:178-183
###################################################
wthPath <- paste(find.package("Dasst"),"extdata",sep="/")
wthFiles <- list.files(path=wthPath, pattern="WTH", 
                       full.names=TRUE)
wth <- read.dssat(wthFiles)
summary(wth)


###################################################
### code chunk number 18: aNoteOnDasst.Rnw:195-196
###################################################
wthSeries <- stackTables(wth[seq(from=2, to=22, by=2)])


###################################################
### code chunk number 19: aNoteOnDasst.Rnw:201-203
###################################################
plot(TMAX ~ as.Date(as.character(DATE),format="%y%j"), 
     wthSeries)


###################################################
### code chunk number 20: aNoteOnDasst.Rnw:209-211
###################################################
plot(TMAX ~ as.Date(as.character(DATE),format="%y%j"), 
     wthSeries)


###################################################
### code chunk number 21: aNoteOnDasst.Rnw:225-234
###################################################
santfile <- system.file("extdata", "SANT7001.MZX", 
                        package="Dasst")
ffn <- paste(tempdir(), "SANT7001.MZX", sep="/")
file.copy(santfile, ffn)
sant <- read.dssat(ffn)
sant[[9]]
sant[[9]][,"FAMN"] <- c(60,120)
sant[[9]]
write.dssat(sant, ffn)


