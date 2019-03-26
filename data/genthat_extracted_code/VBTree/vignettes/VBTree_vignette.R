## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(VBTree)
dim(datatest)
head(datatest[,1:3])
colnames(datatest)

## ------------------------------------------------------------------------
# Save character vector into chrvec:
chrvec <- colnames(datatest)
unregdl <- chrvec2dl(chrvec) # unregularized double list
print(unregdl) # The pure numeric layers (layer2) are not sorted since all elements are treated as character
vbt <- dl2vbt(unregdl)
print(vbt) # elements in layer 2 were sorted

## ------------------------------------------------------------------------
ts <- dl2ts(unregdl) # Convert from double list to tensor
print(ts)
arr <- vbt2arr(vbt) # Convert from vector binary tree to array
print(arr)

## ------------------------------------------------------------------------
regdl <- vbt2dl(vbt)
print(regdl)

## ------------------------------------------------------------------------
subset1 <- datatest[, arr[2,,2,1]]
head(subset1)

## ---- fig.show='hold'----------------------------------------------------
xbatch <- arr[1,4,,1]
ybatch <- arr[2,4,,1]
regdl <- arr2dl(arr)

rpt <- length(xbatch)
i <- 1
for (i in 1:rpt) {
  plt <- plot(datatest[,xbatch[i]], datatest[,ybatch[i]], xlab="Strain", ylab="Stress", main=paste("in T=1050, SR=",regdl[[3]][i], sep = ""))
  plt
}

## ------------------------------------------------------------------------
print(vbt)

## ------------------------------------------------------------------------
subStrain_dl <- list(1, c(3:7), c(2,4), 1)
subStress_dl <- list(2, c(3:7), c(2,4), 1)
# make visiting from original vector binary
# tree and save them as new doube lists:
subStrain_dl2 <- advbtinq(vbt, subStrain_dl) 
subStress_dl2 <- advbtinq(vbt, subStress_dl)
print(subStrain_dl2)
print(subStress_dl2)
xbatch2 <- as.vector(dl2arr(subStrain_dl2))
ybatch2 <- as.vector(dl2arr(subStress_dl2))
print(xbatch2)
print(ybatch2)

## ---- fig.show='hold'----------------------------------------------------
rpt <- length(xbatch2)
i <- 1
for (i in 1:rpt) {
  plt <- plot(datatest[, xbatch2[i]], datatest[, ybatch2[i]], xlab="Strain", ylab="Stress", main=ybatch2[i])
  plt
}


## ------------------------------------------------------------------------
# For original data:
object.size(datatest)
# For tensor and array:
object.size(ts)
object.size(arr)
# For vector binary tree:
object.size(vbt)
# For double list:
object.size(regdl)

