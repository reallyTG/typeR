library(eeptools)


### Name: lag_data
### Title: Create a lag
### Aliases: lag_data

### ** Examples


test_data <- expand.grid(id = sample(letters, 10), 
                        time = 1:10)
test_data$value1 <- rnorm(100)
test_data$value2 <- runif(100)
test_data$value3 <- rpois(100, 4)
group <- "id"
time <- "time"
values <- c("value1", "value2")
vars <- c(group, time, values)
periods <- 2
newdat <- lag_data(test_data, group="id", time="time", 
                 values=c("value1", "value2"), periods=3)



