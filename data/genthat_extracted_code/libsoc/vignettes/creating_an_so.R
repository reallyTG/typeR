## ----create_mle----------------------------------------------------------
MLE <- data.frame(POP_CL=2.23, POP_V=40, IVCL=0.4, IVV=0.3)

## ----add_columntypes-----------------------------------------------------
attributes(MLE)$columnType <- list(c("structuralParameter"), c("structuralParameter"), c("varParameter", "variance"), c("varParameter", "variance"))

## ----create_popest_object------------------------------------------------
library(libsoc)
popest <- so_PopulationEstimates$new()

## ----attach_MLE----------------------------------------------------------
popest$MLE <- MLE

## ----parent_objects------------------------------------------------------
est <- so_Estimation$new()
est$PopulationEstimates <- popest
block <- so_SOBlock$new()
block$blkId <- "myEstimationRun"
block$Estimation <- est
so <- so_SO$new()
so$add_SOBlock(block)

## ----add_message---------------------------------------------------------
block$add_message("WARNING", "myTool", "name_of_warning", "This is the description", 2)

## ----add_rawres----------------------------------------------------------
block$add_rawresults_datafile("Description", "file", "id1")

## ----result--------------------------------------------------------------
so

