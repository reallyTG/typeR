library(postGIStools)


### Name: new_hstore
### Title: Create a empty hstore
### Aliases: new_hstore

### ** Examples

contacts <- data.frame(name = c("Anne", "Bert", "Chris"))
contacts$phone <- new_hstore(3)
contacts$phone %->% "home" <- c("555-123-4567", "555-923-9134", "555-276-1123")
contacts$phone[2] %->% "cell" <- "555-889-9134"
str(contacts)




