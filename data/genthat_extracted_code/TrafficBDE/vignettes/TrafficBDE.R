## ---- warning=FALSE------------------------------------------------------
library(TrafficBDE)
Data <- X163204843_1

## ---- include=TRUE,eval=FALSE, warning=FALSE-----------------------------
#  kStepsForward(Data = Data, Link_id = "163204843", direction = "1", datetime = "2017-01-27 14:00:00", predict = "Mean_speed", steps = 1)

## ---- eval=FALSE, include=TRUE, message=FALSE, warning=FALSE-------------
#  kStepsForward(Data = Data, Link_id = "163204843", direction = "1", datetime = "2017-01-15 20:00:00", predict = "Entries", steps = 1)

