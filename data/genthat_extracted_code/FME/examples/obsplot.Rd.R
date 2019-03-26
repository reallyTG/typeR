library(FME)


### Name: obsplot
### Title: Plot Method for observed data
### Aliases: obsplot
### Keywords: hplot

### ** Examples


## 'observed' data
AIRquality <- cbind(DAY = 1:153, airquality[, 1:4])
head(AIRquality)
obsplot(AIRquality, type="l", xlab="Day since May")

## second set of observed data
AIR2 <- cbind( 1:100, Solar.R = 250 * runif(100), Temp = 90-30*cos(2*pi*1:100/365) )

obsplot(AIRquality, AIR2, type = "l", xlab = "Day since May" , lwd = 1:2)

obsplot(AIRquality, AIR2, type = "l", xlab = "Day since May" , 
         lwd = 1 : 2, which =c("Solar.R", "Temp"), 
         xlim = list(c(0, 150), c(0, 100)))

obsplot(AIRquality, AIR2, type = "l", xlab = "Day since May" , 
         lwd = 1 : 2, which =c("Solar.R", "Temp"), log = c("y", ""))

obsplot(AIRquality, AIR2, which = 1:3, xyswap = c(TRUE,FALSE,TRUE))

## ' a data.frame, with 'treatments', presented in long database format
Data <- ToothGrowth[,c(2,3,1)]
head   (Data)
obsplot(Data, ylab = "len", xlab = "dose")

# same, plotted as two observed data sets
obsplot(subset(ToothGrowth, supp == "VC", select = c(dose, len)),
        subset(ToothGrowth, supp == "OJ", select = c(dose, len)))




