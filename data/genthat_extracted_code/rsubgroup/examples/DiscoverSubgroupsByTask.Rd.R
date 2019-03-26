library(rsubgroup)


### Name: DiscoverSubgroupsByTask
### Title: Performs Subgroup Discovery for a given Task
### Aliases: DiscoverSubgroupsByTask
### Keywords: subgroup task

### ** Examples

# creating a task
data(credit.data)
task <- CreateSDTask(
    credit.data, as.target("class", "bad"), new("SDTaskConfig",
    attributes=c("checking_status", "employment"))) 
taskNum <- CreateSDTask(
    credit.data, as.target("credit_amount"), new("SDTaskConfig",
    attributes=c("checking_status", "employment")))

# running the tasks
DiscoverSubgroupsByTask(task)
DiscoverSubgroupsByTask(taskNum)



