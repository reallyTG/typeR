library(ggforce)


### Name: trans_reverser
### Title: Reverse a transformation
### Aliases: trans_reverser

### ** Examples

# Lets make a plot
p <- ggplot() +
  geom_line(aes(x = 1:10, y = 1:10))

# scales already have a reverse trans
p + scale_x_continuous(trans = 'reverse')

# But what if you wanted to reverse an already log transformed scale?
p + scale_x_continuous(trans = trans_reverser('log'))



