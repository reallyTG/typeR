library(RSwissMaps)


### Name: mun.plot
### Title: Plotting municipality-level maps of Switzerland
### Aliases: mun.plot

### ** Examples

 # Generating sample data:
 dt <- mun.template(2016)
 for(i in 1:nrow(dt)){dt$values[i] <- sample(c(300:700), 1)/1000}

 # Plotting sample data:
 mun.plot(dt$bfs_nr, dt$values, 2016)

 # Plotting sample data for the canton of Aargau:
 mun.plot(dt$bfs_nr, dt$values, 2016, cantons = c("AG"),
 lakes = c("Hallwilersee"))



