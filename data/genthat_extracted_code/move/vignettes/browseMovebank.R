### R code from vignette source 'browseMovebank.Rnw'

###################################################
### code chunk number 1: preliminaries (eval = FALSE)
###################################################
## library("move")


###################################################
### code chunk number 2: createCURLHandle (eval = FALSE)
###################################################
## loginStored <- movebankLogin(username="user", password="password")


###################################################
### code chunk number 3: seatchMovebankStudies (eval = FALSE)
###################################################
## searchMovebankStudies(x="oose", login=loginStored)


###################################################
### code chunk number 4: getMovebankID (eval = FALSE)
###################################################
## getMovebankID("BCI Ocelot",login=loginStored)
## # 123413


###################################################
### code chunk number 5: getMovebankStudy (eval = FALSE)
###################################################
## getMovebankStudy(study="BCI Ocelot",login=loginStored)


###################################################
### code chunk number 6: getMovebankSensors (eval = FALSE)
###################################################
## getMovebankSensors(study="BCI Ocelot",login=loginStored)


###################################################
### code chunk number 7: getMovebankSensorsAll (eval = FALSE)
###################################################
## getMovebankSensors(login=loginStored)


###################################################
### code chunk number 8: getMovebankSensorsAttributes (eval = FALSE)
###################################################
## getMovebankSensorsAttributes(study="BCI Ocelot",login=loginStored)


###################################################
### code chunk number 9: getMovebankAnimals (eval = FALSE)
###################################################
## getMovebankAnimals(study="BCI Ocelot",login=loginStored)


###################################################
### code chunk number 10: getMovebankDataAll (eval = FALSE)
###################################################
## bci_ocelot <- getMovebankData(study="BCI Ocelot", login=loginStored)


###################################################
### code chunk number 11: getMovebankDataInd (eval = FALSE)
###################################################
## # for one individual
## bobby <- getMovebankData(study="BCI Ocelot", animalName="Bobby",
##                          login=loginStored)


###################################################
### code chunk number 12: getMovebankDataInd2 (eval = FALSE)
###################################################
## # for several individuals
## ocelot2ind <- getMovebankData(study="BCI Ocelot", animalName=c("Bobby","Darlen"),
##                               login=loginStored)


###################################################
### code chunk number 13: getMovebankDataTime (eval = FALSE)
###################################################
## # download all data between "2003-03-22 17:44:00.000" and "2003-04-22 17:44:00.000"
## bci_ocelot_range1 <- getMovebankData(study="BCI Ocelot", login=loginStored,
##                                      timestamp_start="20030322174400000",
##                                      timestamp_end="20030422174400000")
## # alternative:
## t<-strptime("20030322174400",format="%Y%m%d%H%M%S", tz='UTC')
## bci_ocelot_ranget <- getMovebankData(study="BCI Ocelot", login=login,
##                                      timestamp_start=t,
##                                      timestamp_end=t+as.difftime(31,units='days'))


###################################################
### code chunk number 14: getMovebankDataTime2 (eval = FALSE)
###################################################
## # download all data before "2003-07-24 20:00:00.000"
## bci_ocelot_range2 <- getMovebankData(study="BCI Ocelot", login=loginStored,
##                                      timestamp_end="20030724200000000")
## 


###################################################
### code chunk number 15: getMovebankDataTime3 (eval = FALSE)
###################################################
## # download all data after "2003-07-01 20:00:00.000" for "Bobby"
## bobby_range <- getMovebankData(study="BCI Ocelot", login=loginStored,
##                                animalName="Bobby", timestamp_start="20030701200000000")


###################################################
### code chunk number 16: removeDuplicatedTimestamps (eval = FALSE)
###################################################
## bci_ocelot <- getMovebankData(study="BCI Ocelot", login=loginStored,
##                               removeDuplicatedTimestamps=TRUE)


###################################################
### code chunk number 17: getMovebankNonLocationData (eval = FALSE)
###################################################
## getMovebankNonLocationData(study=74496970 , sensorID="Acceleration",
##                                animalName="DER AR439", login=loginStored)


###################################################
### code chunk number 18: getMovebankNonLocationData2 (eval = FALSE)
###################################################
## # get acceleration data for all individuals of the study between
## # the "2013-08-15 15:00:00.000" and "2013-08-15 15:01:00.000"
## getMovebankNonLocationData(study=74496970 , sensorID=2365683,
##                            login=loginStored, timestamp_start="20130815150000000",
##                            timestamp_end="20130815150100000")


###################################################
### code chunk number 19: includeExtraSensors (eval = FALSE)
###################################################
## mymove <- getMovebankData(study=74496970, login=loginStored, 
##                           animalName="DER AR439",includeExtraSensors=TRUE)


###################################################
### code chunk number 20: includeExtraSensors (eval = FALSE)
###################################################
## ## to get a data.frame containing the data for the non-location 
## ## sensors use the "unUsedRecords" function 
## nonlocation <- as.data.frame(unUsedRecords(mymove))


###################################################
### code chunk number 21: getDataRepositoryData (eval = FALSE)
###################################################
## getDataRepositoryData("doi:10.5441/001/1.2k536j54")


