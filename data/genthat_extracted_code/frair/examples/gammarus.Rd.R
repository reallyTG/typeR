library(frair)


### Name: gammarus
### Title: Gammarus Functional Response Data
### Aliases: gammarus
### Keywords: datasets

### ** Examples

data(gammarus)
str(gammarus) 

with(gammarus, 
    plot(density, eaten, type='n', 
	xlab='Density', ylab='No. Prey Eaten'))
with(gammarus[gammarus$spp=='G.d.celticus',], 
	points(density-0.2, eaten, pch=20, col=rgb(0,0.5,0,0.2)))
with(gammarus[gammarus$spp=='G.pulex',], 
	points(density+0.2, eaten, pch=20, col=rgb(0.5,0,0,0.2)))

legend(2,20, c('Native', 'Invasive'), pch=20, 
	col=c(rgb(0,0.5,0), rgb(0.5,0,0)))



