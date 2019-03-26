library(ggalt)


### Name: geom_bkde
### Title: Display a smooth density estimate.
### Aliases: geom_bkde stat_bkde

### ** Examples

data(geyser, package="MASS")

ggplot(geyser, aes(x=duration)) +
  stat_bkde(alpha=1/2)

ggplot(geyser, aes(x=duration)) +
  geom_bkde(alpha=1/2)

ggplot(geyser, aes(x=duration)) +
 stat_bkde(bandwidth=0.25)

ggplot(geyser, aes(x=duration)) +
  geom_bkde(bandwidth=0.25)



