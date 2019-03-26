library(bupaR)


### Name: eventlog
### Title: Eventlog
### Aliases: eventlog ieventlog

### ** Examples

## Not run: 
##D data <- data.frame(case = rep("A",5),
##D activity_id = c("A","B","C","D","E"),
##D activity_instance_id = 1:5,
##D lifecycle_id = rep("complete",5),
##D timestamp = 1:5,
##D resource = rep("resource 1", 5))
##D eventlog(data,case_id = "case",
##D activity_id = "activity_id",
##D activity_instance_id = "activity_instance_id",
##D lifecycle_id = "lifecycle_id",
##D timestamp = "timestamp",
##D resource_id = "resource")
## End(Not run)



