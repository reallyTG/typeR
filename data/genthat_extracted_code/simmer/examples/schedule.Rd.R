library(simmer)


### Name: schedule
### Title: Generate a Scheduling Object
### Aliases: schedule

### ** Examples

# Schedule 3 units from 8 to 16 h
#          2 units from 16 to 24 h
#          1 units from 24 to 8 h
capacity_schedule <- schedule(c(8, 16, 24), c(3, 2, 1), period=24)

env <- simmer() %>%
  add_resource("dummy", capacity_schedule)



