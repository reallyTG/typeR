library(musica)


### Name: difs
### Title: Functions for evaluating distance between variables
### Aliases: dif difs rev_dif rev_difv

### ** Examples

getOption('additive_variables')

# calculate distance of 2 vectors
dif(c(10, 20, 30), c(11, 18, 3), 'TAS')
dif(c(10, 20, 30), c(11, 18, 3), 'PR')

# inverse for 2 vectors
rev_dif(c(10, 20, 30), c(11, 18, 3), 'TAS')

# inverse for 1 vector
rev_difv(c(10, 1.1, .9), 'TAS')



