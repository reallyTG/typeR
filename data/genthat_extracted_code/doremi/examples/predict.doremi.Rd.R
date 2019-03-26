library(doremi)


### Name: predict.doremi
### Title: S3 method to predict signal values in a DOREMI object when
###   entering a new excitation
### Aliases: predict.doremi

### ** Examples

myresult <- remi(data = cardio[id == 1],
                 input = "load",
                 time = "time",
                 signal = "hr",
                 embedding = 5)
#Copying cardio into a new data frame and modifying the excitation column
new_exc <- cardio[id == 1, !"id"]

et <- generate.excitation(amplitude = 100,
                                   nexc = 6,
                                   duration = 2,
                                   deltatf = 1,
                                   tmax = 49,
                                   minspacing = 2)
new_exc$load <- et$exc
new_exc$time <- et$t
predresult <- predict(myresult, newdata = new_exc)
plot(predresult)



