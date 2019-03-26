library(rsubgroup)


### Name: CreateSDTask
### Title: Creates a Subgroup Discovery Task
### Aliases: CreateSDTask
### Keywords: subgroup task

### ** Examples

# creating a task
data(credit.data)

# task with binary target
task <- CreateSDTask(credit.data, as.target("class", "good"))

# task with numeric target
taskNum <- CreateSDTask(credit.data, as.target("credit_amount"))



