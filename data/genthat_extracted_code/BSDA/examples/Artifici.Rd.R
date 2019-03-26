library(BSDA)


### Name: Artifici
### Title: Durations of operation for 15 artificial heart transplants
### Aliases: Artifici
### Keywords: datasets

### ** Examples


stem(Artifici$duration, 2)
summary(Artifici$duration)
values <- Artifici$duration[Artifici$duration < 6.5]
values
summary(values)




