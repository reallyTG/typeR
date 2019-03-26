library(recipes)


### Name: step_lag
### Title: Create a lagged predictor
### Aliases: step_lag

### ** Examples

n <- 10
start <- as.Date('1999/01/01')
end <- as.Date('1999/01/10')

df <- data.frame(x = runif(n),
                 index = 1:n,
                 day = seq(start, end, by = "day"))

recipe(~ ., data = df) %>%
  step_lag(index, day, lag = 2:3) %>%
  prep(df) %>%
  bake(df)




