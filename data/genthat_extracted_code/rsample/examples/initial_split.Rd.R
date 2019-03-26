library(rsample)


### Name: initial_split
### Title: Simple Training/Test Set Splitting
### Aliases: initial_split initial_time_split training testing

### ** Examples

set.seed(1353)
car_split <- initial_split(mtcars)
train_data <- training(car_split)
test_data <- testing(car_split)

drinks_split <- initial_time_split(drinks)
train_data <- training(drinks_split)
test_data <- testing(car_split)
c(max(train_data$date), min(test_data$date))  # no overlap



