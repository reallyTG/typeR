library(cheddar)


### Name: PlotWebByLevel
### Title: Plot web by level
### Aliases: PlotWebByLevel
### Keywords: hplot

### ** Examples

# Compare prey-averaged and chain-averaged trophic level
data(TL84)
par(mfrow=c(1,2))
PlotWebByLevel(TL84, ylim=c(1,5.8), main='Prey-averaged')
PlotWebByLevel(TL84, ylim=c(1,5.8), level='ChainAveragedTrophicLevel', 
               main='Chain-averaged')

# Compare the three different x layouts
par(mfrow=c(1,3))
for(x.layout in c('skinny', 'narrow', 'wide'))
{
    PlotWebByLevel(TL84, x.layout=x.layout, main=x.layout)
}

# Compare the effect of round levels before plotting
# Different x-spacing of the four nodes around level 3
par(mfrow=c(1,2))
PlotWebByLevel(TL84, round.levels.to.nearest=0.2)
PlotWebByLevel(TL84, round.levels.to.nearest=0)

# Compare the effect of staggering levels
# Primary producers are staggered in the second plot
par(mfrow=c(1,2))
# No staggering - stagger and max.nodes.per.row are ignored
PlotWebByLevel(TL84, y.layout='compress')
# Stagger
PlotWebByLevel(TL84, y.layout='stagger', stagger=0.1, 
               max.nodes.per.row=20)



