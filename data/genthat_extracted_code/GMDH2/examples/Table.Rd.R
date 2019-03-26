library(GMDH2)


### Name: Table
### Title: Table for Simple Descriptive Statistics
### Aliases: Table
### Keywords: functions

### ** Examples


library(GMDH2)

library(mlbench)
data(BreastCancer)

data <- BreastCancer

# to obtain complete observations
completeObs <- complete.cases(data)
data <- data[completeObs,]

x <- data[,2:10]
y <- data[,11]

Table(x, y)
Table(x, y, output = "LaTeX")





