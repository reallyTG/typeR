library(NetworkInference)


### Name: as_cascade_long
### Title: Transform long data to cascade
### Aliases: as_cascade_long

### ** Examples


df <- simulate_rnd_cascades(10, n_nodes = 20)
cascades <- as_cascade_long(df)
is.cascade(cascades)



