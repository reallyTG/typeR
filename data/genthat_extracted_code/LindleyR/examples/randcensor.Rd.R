library(LindleyR)


### Name: randcensor
### Title: Generate Independent Random Censored Lifetime
### Aliases: randcensor

### ** Examples

x <- randcensor(n = 100, pcens = 0.2, timedistr = 'lindley', censordistr = 'lindley',
 theta = 1.5)
table(x$data['delta']) / 100

x <- randcensor(n = 100, pcens = 0.2, timedistr = 'wlindley', censordistr = 'lindley',
 theta = 1.5, alpha = 0.5)
table(x$data['delta']) / 100

x <- randcensor(n = 100, pcens = 0.2, timedistr = 'weibull', censordistr = 'lindley',
 shape = 0.5, scale = 1.5)
table(x$data['delta']) / 100

x <- randcensor(n = 100, pcens = 0.2, timedistr = 'lnorm', censordistr = 'unif',
 meanlog = 1, sdlog = 1)
table(x$data['delta']) / 100





