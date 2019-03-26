## ----matchnokey----------------------------------------------------------
library(dataCompareR)

# We'll use iris for our comparison
head(iris)

# Make a copy of iris
iris2 <- iris
# And change it, first by subsetting just the first 140 rows
iris2 <- iris2[1:140,]
# then removing the Petal.Width column
iris2$Petal.Width <- NULL
# And then changing some values
iris2[1:10,1] <- iris2[1:10,1] + 1

## ----runcomp-------------------------------------------------------------
# run the comparison
compIris <- rCompare(iris, iris2)

## ----results-------------------------------------------------------------
# Check the results
summary(compIris)


## ----saveReps, eval = FALSE----------------------------------------------
#  # Write the summary to a file
#  saveReport(compIris, reportName = 'compIris')

## ----matchkey------------------------------------------------------------
# We'll use the pressure dataset for comparison
head(pressure)

# Make a copy of pressure
pressure2 <- pressure
# And change it, first by randomising the row order
pressure2 <- pressure2[sample(nrow(pressure2)),]
# then changing just one element, so for temperature of
pressure2[5,1]
# We modify pressure to be twice as large
pressure2[5,2] <- pressure2[5,2] * 2

## ----matchkeycomp--------------------------------------------------------
# run the comparison
compPressure <- rCompare(pressure, pressure2, keys = 'temperature')

## ----matchkeyprint-------------------------------------------------------
# Check the results - use print for a quick summary
print(compPressure)

## ----loaddplyr, echo = FALSE, message= FALSE-----------------------------
library(dplyr)

## ----extract-------------------------------------------------------------
# use generateMismatchData to pull out the mismatching rows from each table
mismatches <- generateMismatchData(compPressure, pressure, pressure2)

mismatches

