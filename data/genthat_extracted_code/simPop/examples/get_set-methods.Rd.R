library(simPop)


### Name: get_set-methods
### Title: Extract and modify variables from population or sample data
###   stored in an object of class 'simPopObj-class'.
### Aliases: get_set-methods pop pop<- pop,simPopObj-method
###   pop<-,simPopObj-method samp samp<- samp,simPopObj-method
###   samp<-,simPopObj-method popData popData,simPopObj-method
###   sampleData,simPopObj-method popObj popObj<-
###   popObj<-,simPopObj,dataObj-method popObj,simPopObj-method sampleData
###   sampleObj sampleObj<- sampleObj,simPopObj-method
###   sampleObj<-,simPopObj,dataObj-method tableObj
###   tableObj,simPopObj-method
### Keywords: manip methods

### ** Examples


data(eusilcS)
inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040",
weight="db090")
simPopObj <- simStructure(data=inp, method="direct", basicHHvars=c("age", "rb090"))

## get/set variables in sample-object of simPopObj
head(samp(simPopObj, var="age"))
samp(simPopObj, var="newVar") <- 1
head(samp(simPopObj, var="newVar"))
## deleting is also possible
samp(simPopObj, var="newvar") <- NULL
head(samp(simPopObj, var="newvar"))
## extract multiple variables
head(samp(simPopObj, var=c("db030","db040")))

## get/set variables in pop-object of simPopObj
head(pop(simPopObj, var="age"))
pop(simPopObj, var="newVar") <- 1
head(pop(simPopObj, var="newVar"))
## deleting is also possible
pop(simPopObj, var="newvar") <- NULL
head(pop(simPopObj, var="newvar"))
## extract multiple variables
head(pop(simPopObj, var=c("db030","db040")))




