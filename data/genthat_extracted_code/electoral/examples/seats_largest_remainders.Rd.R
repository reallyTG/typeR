library(electoral)


### Name: seats_lr
### Title: Allocating Seats - Largest Remainders
### Aliases: seats_lr

### ** Examples

seats_lr(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "hare")

seats_lr(parties = c("V", "W", "X", "Y", "Z"),
      votes = c(100, 150, 60, 80, 160),
      n_seats = 15,
      method = "droop")



