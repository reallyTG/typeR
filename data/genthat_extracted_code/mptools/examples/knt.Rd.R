library(mptools)


### Name: knt
### Title: Plot carrying capacity and abundance trajectories
### Aliases: knt

### ** Examples

mp <- system.file('example.mp', package='mptools')
met <- meta(mp)

# Subset of populations
knt(met, pops=c('Pop 169', 'Pop 170', 'Pop 174', 'Pop 175'), 
    kch(met, dirname(mp)), show_N=TRUE, results=results(mp),
    layout=c(2, 2), samelims=TRUE)



