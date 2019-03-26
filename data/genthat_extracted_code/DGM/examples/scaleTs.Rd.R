library(DGM)


### Name: scaleTs
### Title: Scaling data. Zero centers and scales the nodes (SD=1).
### Aliases: scaleTs

### ** Examples

# create some sample data
ts = array(rnorm(200*5, mean=5, sd=10), dim=c(200,5))
ts = scaleTs(ts)




