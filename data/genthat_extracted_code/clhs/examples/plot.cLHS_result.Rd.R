library(clhs)


### Name: plot.cLHS_result
### Title: Plot cLHS results
### Aliases: plot.cLHS_result

### ** Examples


df <- data.frame(
  a = runif(1000), 
  b = rnorm(1000), 
  c = sample(LETTERS[1:5], size = 1000, replace = TRUE)
)

res <- clhs(df, size = 50, iter = 2000, progress = FALSE, simple = FALSE)

# You can plot only the objective function
plot(res, mode = "obj")

# Or you can compare the distribution in the original object 
# and in the sampled result
plot(res, mode = c("obj", "box"))

	



