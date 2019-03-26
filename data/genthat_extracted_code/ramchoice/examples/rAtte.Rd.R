library(ramchoice)


### Name: rAtte
### Title: rAtte: Estimation and Inference in Random Attention Models
### Aliases: rAtte

### ** Examples

# load data
data(ramdata)

# seed, to replicate simulated critical values
set.seed(42)

result <- rAtte(menu = menu, choice = choice, method = "GMS",
  pref_list=matrix(c(1, 2, 3, 4, 5, 6,
                     2, 3, 4, 5, 6, 1,
                     3, 4, 5, 6, 2, 1,
                     4, 5, 6, 3, 2, 1,
                     6, 5, 4, 3, 2, 1), ncol=6, byrow=TRUE))
summary(result)




