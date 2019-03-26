library(uwIntroStats)


### Name: regress
### Title: General Regression for an Arbitrary Functional
### Aliases: regress fitted.uRegress print.augCoefficients print.uRegress
###   uLRtest uWaldtest termTraverse explode indentNames getLevels testList
###   pasteTwo processTerm addArgs pasteOn pasteOnSpline pastePair
###   movingSum myNext reFormatReg createCols checkNesting splitOnParen
###   reFormat equal
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Loading required libraries
library(survival)
library(sandwich)

# Reading in a dataset
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt",header=TRUE)

# Creating a Surv object to reflect time to death
mri$ttodth <- Surv(mri$obstime,mri$death)

# Attaching the mri dataset
attach(mri)

# Linear regression of atrophy on age
regress("mean", atrophy~age, data=mri)

## Linear regression of atrophy on male and race and their interaction, 
## with a multiple-partial F-test on the race-age interaction
regress("mean", atrophy~ male + U(ra=~race*age), data=mri)

## Linear regression of atrophy on age, male, race (as a dummy variable), chf,
## and diabetes. There are two multiple partial F-tests and both are named
regress("mean", atrophy~age+male+U(rc=~dummy(race)+chf)+U(md=~male+diabetes), data=mri)




