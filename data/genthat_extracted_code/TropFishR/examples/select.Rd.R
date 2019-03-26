library(TropFishR)


### Name: select
### Title: Selectivity model
### Aliases: select

### ** Examples

# Gillnet selectivity
data(tilapia)
out <- select(param = tilapia)
plot(out)

# Trawl selectivity
data(bream)
select(bream)




