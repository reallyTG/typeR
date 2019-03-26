library(crmPack)


### Name: maxDose
### Title: Determine the maximum possible next dose
### Aliases: maxDose maxDose,IncrementsRelative,Data-method
###   maxDose,IncrementsNumDoseLevels,Data-method
###   maxDose,IncrementsRelativeParts,DataParts-method
###   maxDose,IncrementsRelativeDLT,Data-method
###   maxDose,IncrementMin,Data-method
### Keywords: methods

### ** Examples


# Create the data
data <- Data(x=c(0.1, 0.5, 1.5, 3, 6, 8, 8, 8),
             y=c(0, 0, 0, 0, 0, 0, 1, 0),
             cohort=c(0, 1, 2, 3, 4, 5, 5, 5),
             doseGrid=
               c(0.1, 0.5, 1.5, 3, 6, 8,
                 seq(from=10, to=80, by=2)))


# In this example we define a rule for dose increments which would allow:
#   - doubling the dose if the last dose was below 20
#   - only increasing the dose by 1.33 if the last dose was equal or above 20
myIncrements <- IncrementsRelative(intervals=c(0, 20),
                                   increments=c(1, 0.33))

# Based on the rule above, we then calculate the maximum dose allowed
nextMaxDose <- maxDose(myIncrements,
                       data=data)


# Create the data
data <- Data(x=c(0.1, 0.5, 1.5, 3, 6, 8, 8, 8),
             y=c(0, 0, 0, 0, 0, 0, 1, 0),
             cohort=c(0, 1, 2, 3, 4, 5, 5, 5),
             doseGrid=
               c(0.1, 0.5, 1.5, 3, 6, 8,
                 seq(from=10, to=80, by=2)))


# In this example we define a rule for dose increments which would allow:
# maximum skip one dose level, that is 2 dose levels higher is maximum
# increment
myIncrements <- IncrementsNumDoseLevels(maxLevels=2)

# Based on the rule above, we then calculate the maximum dose allowed
nextMaxDose <- maxDose(myIncrements,
                       data=data)


# create an object of class 'DataParts'
myData <- DataParts(x=c(0.1,0.5,1.5),
                    y=c(0,0,0),
                    doseGrid=c(0.1,0.5,1.5,3,6,
                               seq(from=10,to=80,by=2)),
                    part=c(1L,1L,1L),
                    nextPart=1L,
                    part1Ladder=c(0.1,0.5,1.5,3,6,10))


myIncrements <- IncrementsRelativeParts(dltStart=0,
                                        cleanStart=1)

nextMaxDose <- maxDose(myIncrements,
                       data=myData)


# Create the data
data <- Data(x=c(0.1, 0.5, 1.5, 3, 6, 10, 10, 10),
             y=c(0, 0, 0, 0, 0, 0, 1, 0),
             cohort=c(0, 1, 2, 3, 4, 5, 5, 5),
             doseGrid=
               c(0.1, 0.5, 1.5, 3, 6,
                 seq(from=10, to=80, by=2)))


# In this example we define a rule for dose increments which would allow:
#   - doubling the dose if no DLTs were yet observed
#   - only increasing the dose by 1.33 if 1 or 2 DLTs were already observed
#   - only increasing the dose by 1.2 if at least 3 DLTs were already observed
myIncrements <- IncrementsRelativeDLT(DLTintervals = c(0, 1, 3),
                                      increments = c(1, 0.33, 0.2))

# Based on the rule above, we then calculate the maximum dose allowed
nextMaxDose <- maxDose(myIncrements,
                       data=data)


# Create the data
data <- Data(x=c(0.1, 0.5, 1.5, 3, 6, 8, 8, 8),
             y=c(0, 0, 0, 0, 0, 0, 1, 0),
             cohort=c(0, 1, 2, 3, 4, 5, 5, 5),
             doseGrid=
               c(0.1, 0.5, 1.5, 3, 6, 8,
                 seq(from=10, to=80, by=2)))


# As example, here we are combining 2 different increment rules. 

# The first rule is the following: 
#      maximum doubling the dose if no DLTs were observed at the current dose
#      or maximum increasing the dose by 1.33 if 1 or 2 DLTs were observed at the current dose
#      or maximum increasing the dose by 1.22 if 3 or more DLTs were observed

# The second rule is the following: 
#   maximum doubling the dose if the current dose is <20
#   OR only maximum increasing the dose by 1.33 if the current dose is >=20

myIncrements1 <- IncrementsRelativeDLT(DLTintervals = c(0, 1, 3),
                                       increments = c(1, 0.33, 0.2))

myIncrements2 <- IncrementsRelative(intervals=c(0, 20),
                                    increments=c(1, 0.33))

# Now we combine the 2 rules
combIncrement <- IncrementMin(IncrementsList=
                                list(myIncrements1,myIncrements2))

# Finally we then calculate the maximum dose allowed by taking the minimum of the two rules
nextMaxDose <- maxDose(combIncrement, 
                       data)




