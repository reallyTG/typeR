library(epiDisplay)


### Name: aggregate plot
### Title: Plot summary statistics of a numeric variable by group
### Aliases: aggregate.plot
### Keywords: database

### ** Examples

data(Compaq)
.data <- Compaq
attach(.data)
aggregate.plot(x=year, by=list(HOSPITAL = hospital, STAGE = stage), 
   return = TRUE)
# moving legend and chaging bar colours
aggregate.plot(x=year, by=list(HOSPITAL = hospital, STAGE = stage), error="ci",
  legend.site = "topleft", bar.col = c("red","blue"))
detach(.data)

# Example with regular time intervals (all frequencies > 3)
data(Sitka, package="MASS")
.data <- Sitka
attach(.data)
tab1(Time, graph=FALSE) # all frequencies > 3
aggregate.plot(x=size, by=Time, cap.size = 0) # Note no cap on error bars
# For black and white presentation
aggregate.plot(x=size, by=Time, grouping=treat, FUN="median", 
  line.col=3:4, lwd =2)
detach(.data)

# Example with irregular time intervals (some frequencies < 3)
data(BP)
.data <- BP
attach(.data) 
des(.data)
age <- as.numeric(as.Date("2008-01-01") - birthdate)/365.25
aggregate.plot(x=sbp, by=age, grouping=saltadd, bin.method="quantile")
aggregate.plot(x=sbp, by=age, grouping=saltadd, lwd=3, 
  line.col=c("blue","green") , main = NULL)
title(main="Effect of age and salt adding on SBP", xlab="years",ylab="mm.Hg")
points(age[saltadd=="no"], sbp[saltadd=="no"], col="blue")
points(age[saltadd=="yes"], sbp[saltadd=="yes"], pch=18, col="green")
detach(.data)
rm(list=ls())

## For a binary outcome variable, aggregrated probabilities is computed
data(Outbreak)
.data <- Outbreak
attach(.data)
.data$age[.data$age == 99] <- NA
detach(.data)
attach(.data)
aggregate.plot(diarrhea, by=age, bin.time=5)
diarrhea1 <- factor(diarrhea)
levels(diarrhea1) <- c("no","yes")
aggregate.plot(diarrhea1, by=age, bin.time=5)
detach(.data)
rm(list=ls())



