library(nos)


### Name: NOSM_POT_dir
### Title: Compute NOS using a directed network and with a user provided
###   network of potential interactions
### Aliases: NOSM_POT_dir

### ** Examples

data(boreal)
y <-  boreal[1:300,] #subset 300 rows for speed
d <- sample(nrow(y), 200, replace = FALSE) #create a random pot_net
pot_net <- y[d,] #by randomly sampling 200 rows from boreal
x <- NOSM_POT_dir(y, pot_net, perc = 1, sl = 1)
summary(x)



