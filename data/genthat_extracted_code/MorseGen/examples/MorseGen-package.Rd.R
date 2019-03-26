library(MorseGen)


### Name: MorseGen-package
### Title: Simple raw data generator based on user-specified summary
###   statistics
### Aliases: MorseGen-package MorseGen
### Keywords: package datagen

### ** Examples

# Generate a sample of 10 scores 
# with a mean equal to 18.4 and a 
# standard deviation of 3.2.

stat.gen(10,18.4,3.2)

# Generate a sample of 20 scores with 
# a mean equal to 9.1, and a standard 
# deviation of 3.2. Additionally, the 
# raw data must be in positive, whole-
# unit integers.

stat.gen(10,18.4,3.2,data.dec=0,neg.data=FALSE)

# Generate two variables (with means 5.65 
# & 100.2 and standard deviations 2.13 & 16.8 
# respectively) from 15 individuals that are 
# correlated at r = -.68

cor.gen(15,5.65,2.13,100.2,16.8,-.68)



