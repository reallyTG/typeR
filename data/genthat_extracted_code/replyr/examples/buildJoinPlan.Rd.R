library(replyr)


### Name: buildJoinPlan
### Title: Build a join plan
### Aliases: buildJoinPlan

### ** Examples


d <- data.frame(id=1:3, weight= c(200, 140, 98))
tDesc <- rbind(tableDescription('d1', d),
               tableDescription('d2', d))
tDesc$keys[[1]] <- list(PrimaryKey= 'id')
tDesc$keys[[2]] <- list(PrimaryKey= 'id')
buildJoinPlan(tDesc)




