library(doremi)


### Name: plot.doremi
### Title: S3 method to plot DOREMI objects
### Aliases: plot.doremi

### ** Examples

mydata <- generate.panel.remi(nind = 2,
                           dampingtime = 10,
                           amplitude = c(5,10),
                           nexc = 2,
                           duration = 20,
                           deltatf = 2,
                           tmax = 200,
                           minspacing = 0,
                           internoise = 0.2,
                           intranoise = 0.1)
myresult <- remi(data = mydata,
                 id = "id",
                 input = "excitation",
                 time = "time",
                 signal = "dampedsignal",
                 embedding = 5)
plot(myresult)



