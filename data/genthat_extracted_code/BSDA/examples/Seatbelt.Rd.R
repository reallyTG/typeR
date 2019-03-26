library(BSDA)


### Name: Seatbelt
### Title: Injury level versus seatbelt usage
### Aliases: Seatbelt
### Keywords: datasets

### ** Examples


T1 <- xtabs(~seatbelt + injuries, data = Seatbelt)
T1
chisq.test(T1)
rm(T1)




