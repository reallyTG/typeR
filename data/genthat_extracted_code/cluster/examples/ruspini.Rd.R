library(cluster)


### Name: ruspini
### Title: Ruspini Data
### Aliases: ruspini
### Keywords: datasets

### ** Examples

data(ruspini)

## Plot similar to Figure 4 in Stryuf et al (1996)
## Not run: plot(pam(ruspini, 4), ask = TRUE)
## Don't show: 
plot(pam(ruspini, 4))
## End(Don't show)

## Plot similar to Figure 6 in Stryuf et al (1996)
plot(fanny(ruspini, 5))



