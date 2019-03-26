library(UBL)


### Name: RandOverRegress
### Title: Random over-sampling for imbalanced regression problems
### Aliases: RandOverRegress
### Keywords: pre-processing regression

### ** Examples


data(morley)

C.perc = list(2, 4)
myover <- RandOverRegress(Speed~., morley, C.perc=C.perc)
Bal <- RandOverRegress(Speed~., morley, C.perc= "balance")
Ext <- RandOverRegress(Speed~., morley, C.perc= "extreme")

library(DMwR)
data(algae)
clean.algae <- algae[complete.cases(algae), ]
# all automatic
ROB <-RandOverRegress(a7~., clean.algae)
# user defined percentage for the only existing extreme (high)
myRO <-RandOverRegress(a7~., clean.algae, rel = "auto", thr.rel = 0.7,
                        C.perc = list(5))

# check the results
plot(clean.algae[,c(1,ncol(clean.algae))])
plot(ROB[,c(1,ncol(clean.algae))])
plot(myRO[,c(1,ncol(clean.algae))])




