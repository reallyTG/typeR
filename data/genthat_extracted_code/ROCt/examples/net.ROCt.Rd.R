library(ROCt)


### Name: net.ROCt
### Title: Net Time-Dependent ROC Curves With Right Censored Data.
### Aliases: net.ROCt
### Keywords: net survival

### ** Examples


# import the observed data

data(dataDIVAT)

# A subgroup analysis to reduce the time needed for this example

dataDIVAT <- dataDIVAT[1:400,]

# import the expected mortality rates

data(fr.ratetable)

# the values of recipient age used for computing the sensibilities and
# specificities (choose more values in practice)

age.cut <- quantile(dataDIVAT$ageR, probs=seq(0.1, 0.9, by=0.1))

# recoding of the variables for matching with the ratetable

dataDIVAT$sex <- "male"
dataDIVAT$sex[dataDIVAT$sexeR==0] <- "female"
dataDIVAT$year <- mdy.date(month=01, day=01, year=dataDIVAT$year.tx,
 nineteen = TRUE, fillday = FALSE, fillmonth = FALSE)
dataDIVAT$age <- dataDIVAT$ageR*365

# the ROC curve (without correction by the knn estimator) to 
# reduce the time for computing this example. In prectice, the
# correction should by used in case of non-montone results.

roc1 <- net.ROCt(times=dataDIVAT$death.time,
 failures=dataDIVAT$death,  variable=dataDIVAT$ageR,
 p.age=dataDIVAT$age, p.sex=dataDIVAT$sex, p.year=dataDIVAT$year,
 rate.table=fr.ratetable, pro.time=3000, cut.off=age.cut, knn=FALSE)
 
# the sensibilities and specificities associated with the cut off values

roc1$table

# the traditional ROC graph

plot(c(1,1-roc1$table$sp,0), c(1,roc1$table$se,0), ylim=c(0,1), xlim=c(0,1), 
 ylab="sensitivity", xlab="1-specificity", type="l", lty=1, col=2, lwd=2)
 
abline(c(0,0), c(1,1), lty=2)

legend("bottomright", paste("Without knn, (AUC=",
 round(roc1$auc, 2), ")", sep=""),lty=1, lwd=2, col=2)




