library(metamer)


### Name: metamerize
### Title: Create metamers
### Aliases: metamerize

### ** Examples

data(cars)
# Metamers of `cars` with the same mean speed and dist, and correlation
# between the two.
means_and_cor <- delayed_with(mean_speed = mean(speed),
                              mean_dist = mean(dist),
                              cor = cor(speed, dist))
set.seed(42)  # for reproducibility.
metamers <- metamerize(cars,
                       preserve = means_and_cor,
                       signif = 3,
                       N = 1000)
print(metamers)

last <- metamers[[length(metamers)]]

# Confirm that the statistics are the same
cbind(original = means_and_cor(cars),
      metamer = means_and_cor(last))

# Visualize
plot(metamers[[length(metamers)]])
points(cars, col = "red")




