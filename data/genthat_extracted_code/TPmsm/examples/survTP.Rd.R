library(TPmsm)


### Name: survTP
### Title: Create a survTP object
### Aliases: survTP is.survTP
### Keywords: multivariate survival

### ** Examples

data(bladderTP)
bladderTP_obj <- with(bladderTP, survTP(time1, event1, Stime, event))
#or
bladderTP_obj <- survTP(bladderTP$time1, bladderTP$event1, bladderTP$Stime,
bladderTP$event)
data(heartTP)
heartTP_obj <- with(heartTP, survTP(time1, event1, Stime, event, age=age))
#or
heartTP_obj <- survTP(heartTP$time1, heartTP$event1, heartTP$Stime,
heartTP$event, age=heartTP$age)



