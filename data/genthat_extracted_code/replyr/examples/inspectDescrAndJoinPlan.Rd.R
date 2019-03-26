library(replyr)


### Name: inspectDescrAndJoinPlan
### Title: check that a join plan is consistent with table descriptions
### Aliases: inspectDescrAndJoinPlan

### ** Examples


# example data
d1 <- data.frame(id= 1:3,
                 weight= c(200, 140, 98),
                 height= c(60, 24, 12))
d2 <- data.frame(pid= 2:3,
                 weight= c(130, 110),
                 width= 1)
# get the initial description of table defs
tDesc <- rbind(tableDescription('d1', d1),
               tableDescription('d2', d2))
# declare keys (and give them consistent names)
tDesc$keys[[1]] <- list(PrimaryKey= 'id')
tDesc$keys[[2]] <- list(PrimaryKey= 'pid')
# build the join plan
columnJoinPlan <- buildJoinPlan(tDesc)
# confirm the plan
inspectDescrAndJoinPlan(tDesc, columnJoinPlan,
                        checkColClasses= TRUE)
# damage the plan
columnJoinPlan$sourceColumn[columnJoinPlan$sourceColumn=='width'] <- 'wd'
# find a problem
inspectDescrAndJoinPlan(tDesc, columnJoinPlan,
                        checkColClasses= TRUE)




