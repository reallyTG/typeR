library(rollply)


### Name: rollply
### Title: Rollply
### Aliases: rollply

### ** Examples


# see also vignette("rollply") for a visual introduction
library(plyr)

# 1D example: make a trendline for a time-series
dat <- data.frame(time     = seq.int(1000),
                  position = cumsum(rnorm(1000,0,10)))

rollav <- rollply(dat, ~ time, wdw.size=10,
                  summarise, position=mean(position))

plot(position ~ time, data = dat, pch = 20)
lines(rollav, col = 'red', lwd = 3)

# 2D example

# Generate three 2D random walks
dat <- ddply(data.frame(person = c('francois','nicolas','jacques')), 
             ~ person,
             summarise, time = seq.int(1000),
                        x    = cumsum(rnorm(1000,0,1)),
                        y    = cumsum(rnorm(1000,0,1)))

# Smoothed trajectory over ten time-steps
rollav <- rollply(dat, ~ time | person, wdw.size = 10, grid_res = 1000,
                  summarise, x = mean(x), y = mean(y))

if ( require(ggplot2) ) {
  ggplot(dat, aes(x, y, color = person)) +
    geom_point(alpha = .5, shape = '+') +
    geom_path(data = rollav)
}

# Where did people spend their time ?
# we pregenerate the grid to fix it across groups
fixed_grid <- build_grid_squaretile(dat[ ,c('x','y')], 2000) 
rollav <- rollply(dat, ~ x + y | person, wdw.size = 2, grid = fixed_grid,
                  summarise, time.spent = length(time))

if ( require(ggplot2) ) {
  ggplot(subset(rollav, time.spent > 0)) +
    geom_point(aes(x, y, color = person, size = time.spent), alpha = .5) +
    facet_grid(~person)
}





