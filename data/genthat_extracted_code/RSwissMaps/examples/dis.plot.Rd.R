library(RSwissMaps)


### Name: dis.plot
### Title: Plotting district-level maps of Switzerland
### Aliases: dis.plot

### ** Examples

 # Generating sample data:
 dt <- dis.template(2016)
 for(i in 1:nrow(dt)){dt$values[i] <- sample(c(300:700), 1)/1000}

 # Plotting sample data:
 dis.plot(dt$bfs_nr, dt$values, 2016)

 # Plotting sample data for the canton of Aargau:
 dis.plot(dt$bfs_nr, dt$values, 2016, cantons = c("AG"),
 lakes = c("Hallwilersee"))



