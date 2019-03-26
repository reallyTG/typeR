library(MicSim)


### Name: micSimParallel
### Title: Run microsimulation (parallel computing)
### Aliases: micSimParallel

### ** Examples

######################################################################################
# Complex example dealing with mortality, changes in the fertily and the marital 
# status, in the educational attainment, as well as dealing with migration
# (A simpler example is given on the help page of the "micSim" function of this package.)
######################################################################################
## No test: 
# Clean workspace 
rm(list=ls())

# Defining simulation horizon
simHorizon <- setSimHorizon(startDate="01/01/2014", endDate="31/12/2024")

# Seed for random number generator
set.seed(234)

# Definition of maximal age 
maxAge <- 100  

# Defintion of nonabsorbing and absorbing states
sex <- c("m","f")                     
fert <- c("0","1+")           
marital <- c("NM","M","D","W")        
edu <- c("no","low","med","high")   
stateSpace <- expand.grid(sex=sex,fert=fert,marital=marital,edu=edu)
absStates <- c("dead","rest")   

# General date of enrollment to elementary school
dateSchoolEnrol <- "09/01"

# Definition of an initial population (for illustration purposes, create a random population)
N = 10000                                                       
initBirthDatesRange <- chron(dates=c("31/12/1950","01/01/2014"),format=c(dates="d/m/Y"),
  out.format=c(dates="d/m/year"))
set.seed(124) # Set a seed for the random number generator (to make results repeatable)
birthDates <- dates(initBirthDatesRange[1] + runif(N, min=0, max=diff(initBirthDatesRange)))
getRandInitState <- function(birthDate){
  age <- trunc(as.numeric(simHorizon[1] - birthDate)/365.25)
  s1 <- sample(sex,1)
  s2 <- ifelse(age<=18, fert[1], sample(fert,1))
  s3 <- ifelse(age<=18, marital[1], ifelse(age<=22, sample(marital[1:3],1), 
    sample(marital,1)))
  s4 <- ifelse(age<=7, edu[1], ifelse(age<=18, edu[2], ifelse(age<=23, sample(edu[2:3],1), 
    sample(edu[-1],1))))
  initState <- paste(c(s1,s2,s3,s4),collapse="/")
  return(initState)
}
initPop <- data.frame(ID=1:N, birthDate=birthDates, 
  initState=sapply(birthDates, getRandInitState))

# Definition of immigrants entering the population (for illustration purposes, create immigrants 
# randomly)
M = 2000                                                           
immigrDatesRange <- as.numeric(simHorizon)
immigrDates <- dates(chron(immigrDatesRange[1] + runif(M, min=0,max=diff(immigrDatesRange)), 
  format=c(dates="d/m/Y", times="h:m:s"), out.format=c(dates="d/m/year",times="h:m:s")))
immigrAges <- runif(M, min=15*365.25, max=70*365.25)
immigrBirthDates <- dates(chron(as.numeric(immigrDates) - immigrAges, 
  format=c(dates="d/m/Y", times="h:m:s"), out.format=c(dates="d/m/year", times="h:m:s")))
IDmig <- max(as.numeric(initPop[,"ID"]))+(1:M)
immigrPop <- data.frame(ID = IDmig, immigrDate = immigrDates, birthDate=immigrBirthDates, 
  immigrInitState=sapply(immigrBirthDates, getRandInitState))  

# Definition of initial states for newborns 
initStates <- rbind(c("m","0","NM","no"),c("f","0","NM","no")) 
# Definition of related occurrence probabilities
initStatesProb <- c(0.515,0.485)                              

# Definition of (possible) transition rates  
# (1) Fertility rates (Hadwiger mixture model)
fert1Rates <- function(age, calTime, duration){  # parity 1
  b <- ifelse(calTime<=2020, 3.9, 3.3)
  c <- ifelse(calTime<=2020, 28, 29)
  rate <-  (b/c)*(c/age)^(3/2)*exp(-b^2*(c/age+age/c-2))
  rate[age<=15 | age>=45] <- 0
  return(rate)
}
fert2Rates <- function(age, calTime, duration){  # partiy 2+
  b <- ifelse(calTime<=2020, 3.2, 2.8)
  c <- ifelse(calTime<=2020, 32, 33)
  rate <-  (b/c)*(c/age)^(3/2)*exp(-b^2*(c/age+age/c-2))
  rate[age<=15 | age>=45 | duration<0.75] <- 0
  return(rate)
}
# (2) Rates for first marriage (normal density)
marriage1Rates <- function(age, calTime, duration){  
  m <- ifelse(calTime<=2020, 25, 30)
  s <- ifelse(calTime<=2020, 3, 3)
  rate <- dnorm(age, mean=m, sd=s)
  rate[age<=16] <- 0
  return(rate)
}
# (3) Remariage rates (log-logistic model)
marriage2Rates <- function(age, calTime, duration){  
  b <- ifelse(calTime<=2020, 0.07, 0.10)
  p <- ifelse(calTime<=2020, 2.7, 2.7)
  lambda <- ifelse(calTime<=1950, 0.04, 0.03)
  rate <- b*p*(lambda*age)^(p-1)/(1+(lambda*age)^p)
  rate[age<=18] <- 0
  return(rate)
}
# (4) Divorce rates (normal density)
divorceRates <- function(age, calTime, duration){
  m <- 40
  s <- ifelse(calTime<=2020, 7, 6)
  rate <- dnorm(age,mean=m,sd=s)
  rate[age<=18] <- 0
  return(rate)
}
# (5) Widowhood rates (gamma cdf)
widowhoodRates <- function(age, calTime, duration){
  rate <- ifelse(age<=30, 0, pgamma(age-30, shape=6, rate=0.06))
  return(rate)
}
# (6) Rates to change educational attainment
# Set rate to `Inf' to make transition for age 7 deterministic.
noToLowEduRates <- function(age, calTime, duration){
  rate <- ifelse(age==7,Inf,0) 
  return(rate)
}
lowToMedEduRates <- function(age, calTime, duration){
  rate <- dnorm(age,mean=16,sd=1)
  rate[age<=15 | age>=25] <- 0
  return(rate)
}
medToHighEduRates <- function(age, calTime, duration){
  rate <- dnorm(age,mean=20,sd=3)
  rate[age<=18 | age>=35] <- 0
  return(rate)
}
# (7) Mortality rates (Gompertz model)
mortRates <- function(age, calTime, duration){
  a <- 0.00003
  b <- ifelse(calTime<=2020, 0.1, 0.097)
  rate <- a*exp(b*age)
  return(rate)
}
# (8) Emigration rates 
emigrRates <- function(age, calTime, duration){
  rate <- ifelse(age<=18,0,0.0025)
  return(rate)
}

# Transition pattern and assignment of functions specifying transition rates
fertTrMatrix <- cbind(c("0->1+","1+->1+"),                         
  c("fert1Rates", "fert2Rates"))
maritalTrMatrix <- cbind(c("NM->M","M->D","M->W","D->M","W->M"),              
  c("marriage1Rates","divorceRates","widowhoodRates",
  "marriage2Rates","marriage2Rates"))
eduTrMatrix <- cbind(c("no->low","low->med","med->high"),
  c("noToLowEduRates","lowToMedEduRates","medToHighEduRates")) 
allTransitions <- rbind(fertTrMatrix, maritalTrMatrix, eduTrMatrix)
absTransitions <- rbind(c("dead","mortRates"),c("rest","emigrRates"))
transitionMatrix <- buildTransitionMatrix(allTransitions=allTransitions,
  absTransitions=absTransitions, stateSpace=stateSpace)

# Define transitions triggering a birth event
fertTr <- fertTrMatrix[,1]
## End(No test)

# Run microsimulation on cluster with five cores (settings depend on cluster used) 
## Not run: 
##D cores <- 5
##D seeds <- c(1233,1245,1234,5,2)
##D pop <- micSimParallel(initPop=initPop, immigrPop=immigrPop, 
##D   transitionMatrix=transitionMatrix, absStates=absStates, initStates=initStates, 
##D   initStatesProb=initStatesProb, maxAge=maxAge, simHorizon=simHorizon, 
##D   fertTr=fertTr, dateSchoolEnrol=dateSchoolEnrol, 
##D   cores=cores, seeds=seeds)
## End(Not run)



