library(diverse)


### Name: sim_dataset
### Title: A procedure to simulate datasets
### Aliases: sim_dataset

### ** Examples

sim_dataset(n_categ=50,  category_prefix='ctg', values=1) #equal value, just one entity
#Several entities with random values
n_entities <- 50
v_n_c <- sample(1:100, size = n_entities, replace=TRUE)
v_v <- sample(10:5000, size= n_entities, replace=TRUE)
d <- sim_dataset(n_categ = v_n_c, values= v_v, category_random = TRUE)



