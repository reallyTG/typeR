library(UBL)


### Name: SmoteClassif
### Title: SMOTE algorithm for unbalanced classification problems
### Aliases: SmoteClassif
### Keywords: pre-processing classification

### ** Examples

## A small example with a data set created artificially from the IRIS
## data 
data(iris)
dat <- iris[, c(1, 2, 5)]
dat$Species <- factor(ifelse(dat$Species == "setosa", "rare", "common")) 
## checking the class distribution of this artificial data set
table(dat$Species)

## now using SMOTE to create a more "balanced problem"
newData <- SmoteClassif(Species ~ ., dat, C.perc = list(common = 1,rare = 6))
table(newData$Species)

## Checking visually the created data
par(mfrow = c(1, 2))
plot(dat[, 1], dat[, 2], pch = 19 + as.integer(dat[, 3]),
     main = "Original Data")
plot(newData[, 1], newData[, 2], pch = 19 + as.integer(newData[, 3]),
     main = "SMOTE'd Data")


# automatically balancing the data maintaining the total number of examples
datBal <- SmoteClassif(Species ~ ., dat, C.perc = "balance")
table(datBal$Species)

# automatically inverting the original distribution of examples 
datExt <- SmoteClassif(Species ~ ., dat, C.perc = "extreme")
table(datExt$Species)


 library(DMwR)
 data(algae)
 clean.algae <- algae[complete.cases(algae),]
 C.perc = list(autumn = 2, summer = 1.5, winter = 0.9) 
 # class spring remains unchanged
 # In this case it is necessary to define a distance function that 
 # is able to deal with both nominal and numeric features 
 mysmote.algae <- SmoteClassif(season~., clean.algae, C.perc, dist = "HEOM")
 # the distance function may be HVDM 
 smoteBalan.algae <- SmoteClassif(season~., clean.algae, "balance",
                                  dist = "HVDM")
 smoteExtre.algae <- SmoteClassif(season~., clean.algae, "extreme",
                                  dist = "HVDM")

  library(MASS)
  data(cats)
  mysmote.cats <- SmoteClassif(Sex~., cats, list(M = 0.8, F = 1.8))
  smoteBalan.cats <- SmoteClassif(Sex~., cats, "balance")
  smoteExtre.cats <- SmoteClassif(Sex~., cats, "extreme")




