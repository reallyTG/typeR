library(qicharts)


### Name: trc
### Title: Trellis run charts for multivariate data
### Aliases: trc

### ** Examples

# Trellis run chart on 1 conditioning variable
d1 <- data.frame(y = rnorm(96, 12, 3),
                 expand.grid(x = 1:24,
                             g = LETTERS[1:4]))
trc(y ~ x | g, data = d1, main = 'Trellis run chart')

# Add target line
trc(y ~ x | g, data = d1, main = 'Trellis run chart', target = 20)

# Trellis run chart on 2 conditioning variables
d2 <- data.frame(y = rnorm(144, 12, 3),
                 expand.grid(x = seq.Date(as.Date('2014-1-1'),
                                          by = 'week',
                                          length.out = 24),
                             g1 = LETTERS[1:3],
                             g2 = letters[1:2]))
trc(y ~ x | g1 + g2, data = d2, main = 'Trellis run chart')

# Introduce a shift in process performance
d2$y[132:144] <- d2$y[132:144] * 3
trc(y ~ x | g1 + g2, data = d2, main = 'Trellis run chart')

# Make I chart
trc(y ~ x | g1 + g2, data = d2, main = 'Trellis run chart', chart = 'i')



