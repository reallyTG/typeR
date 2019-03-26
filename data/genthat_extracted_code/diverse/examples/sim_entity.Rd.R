library(diverse)


### Name: sim_entity
### Title: A procedure to simulate entities
### Aliases: sim_entity

### ** Examples

sim_entity(n_categ=50,  category_prefix='ctg', values=1) #equal value
#random numbers for values of abundance
sim_entity(n_categ=50,  category_prefix='ctg', values=sample(1:100, replace=TRUE))
sim_entity(n_categ=50,  category_prefix='ctg', values='log-normal') #equal value



