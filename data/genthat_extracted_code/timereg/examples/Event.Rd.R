library(timereg)


### Name: Event
### Title: Event history object
### Aliases: Event as.character.Event as.matrix.Event [.Event format.Event
###   print.Event rbind.Event summary.Event

### ** Examples


	t1 <- 1:10
	t2 <- t1+runif(10)
	ca <- rbinom(10,2,0.4)
	(x <- Event(t1,t2,ca))




