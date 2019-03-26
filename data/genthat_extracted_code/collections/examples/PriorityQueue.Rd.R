library(collections)


### Name: PriorityQueue
### Title: Priority Queue
### Aliases: PriorityQueue
### Keywords: datasets

### ** Examples

q <- PriorityQueue$new()
q$push("not_urgent")
q$push("urgent", priority = 2)
q$push("not_as_urgent", priority = 1)
q$pop()  # urgent
q$pop()  # not_as_urgent
q$pop()  # not_urgent



