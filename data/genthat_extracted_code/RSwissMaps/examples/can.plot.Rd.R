library(RSwissMaps)


### Name: can.plot
### Title: Plotting canton-level maps of Switzerland
### Aliases: can.plot

### ** Examples

 # Generating sample data:
 dt <- can.template(2016)
 for(i in 1:nrow(dt)){dt$values[i] <- sample(c(300:700), 1)/1000}

 # Plotting sample data:
 can.plot(dt$bfs_nr, dt$values, 2016)



