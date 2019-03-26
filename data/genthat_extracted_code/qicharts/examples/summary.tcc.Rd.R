library(qicharts)


### Name: summary.tcc
### Title: Summarise Trellis Control Charts
### Aliases: summary.tcc

### ** Examples

# Build data frame for example
d <- data.frame(x = rep(1:24, 4),
                mo = (rep(seq(as.Date('2014-1-1'),
                              length.out = 24,
                              by = 'month'),
                          4)),
                n = rbinom(4 * 24, 100, 0.5),
                d = round(runif(4 * 24, 90, 110)),
                g1 = rep(c('a', 'b'), each = 48),
                g2 = rep(c('A', 'B'), each = 24))

# P chart
p <- tcc(n, d, mo, g1 = g1, g2 = g2, breaks = 12, data = d, chart = 'p')
plot(p)
summary(p)



