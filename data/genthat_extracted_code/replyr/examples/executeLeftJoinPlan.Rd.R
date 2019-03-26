library(replyr)


### Name: executeLeftJoinPlan
### Title: Execute an ordered sequence of left joins.
### Aliases: executeLeftJoinPlan

### ** Examples



# example data
meas1 <- data.frame(id= c(1,2),
                    weight= c(200, 120),
                    height= c(60, 14))
meas2 <- data.frame(pid= c(2,3),
                    weight= c(105, 110),
                    width= 1)
# get the initial description of table defs
tDesc <- rbind(tableDescription('meas1', meas1),
               tableDescription('meas2', meas2))
# declare keys (and give them consitent names)
tDesc$keys[[1]] <- list(PatientID= 'id')
tDesc$keys[[2]] <- list(PatientID= 'pid')
# build the column join plan
columnJoinPlan <- buildJoinPlan(tDesc)
# decide we don't want the width column
columnJoinPlan$want[columnJoinPlan$resultColumn=='width'] <- FALSE
# double check our plan
if(!is.null(inspectDescrAndJoinPlan(tDesc, columnJoinPlan,
            checkColClasses= TRUE))) {
  stop("bad join plan")
}
# execute the left joins
executeLeftJoinPlan(tDesc, columnJoinPlan,
                    checkColClasses= TRUE,
                    verbose= TRUE)
# also good
executeLeftJoinPlan(list('meas1'=meas1, 'meas2'=meas2),
                    columnJoinPlan,
                    checkColClasses= TRUE,
                    verbose= TRUE)




