library(randgeo)


### Name: rg_position
### Title: Random position
### Aliases: rg_position

### ** Examples

rg_position()
rg_position(10)
rg_position(100)
rg_position(bbox = c(50, 50, 60, 60))

# coerce to data.frame
stats::setNames(
  do.call("rbind.data.frame", rg_position(10)),
  c('lng', 'lat')
)



