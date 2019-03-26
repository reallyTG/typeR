library(econullnetr)


### Name: generate_null_net
### Title: Null models for ecological networks
### Aliases: generate_null_net

### ** Examples

null.1 <- generate_null_net(Silene[, 2:7], Silene.plants[, 2:6], sims = 10,
  data.type = "names", summary.type = "sum", c.samples = Silene[, 1],
  r.samples = Silene.plants[, 1])




