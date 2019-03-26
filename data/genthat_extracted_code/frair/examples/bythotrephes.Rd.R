library(frair)


### Name: bythotrephes
### Title: Bythotrephes Functional Response Data
### Aliases: bythotrephes
### Keywords: datasets

### ** Examples

data(bythotrephes)
str(bythotrephes) 

with(bythotrephes, 
	plot(density, eaten, type='n', 
	xlab='Density', ylab='No. Prey Eaten'))
with(bythotrephes[bythotrephes$size=='large',], 
	points(density-0.2, eaten, pch=20, col=rgb(0.5,0,0,0.4)))
with(bythotrephes[bythotrephes$size=='medium',], 
	points(density, eaten, pch=20, col=rgb(0,0.5,0,0.4)))
with(bythotrephes[bythotrephes$size=='small',], 
	points(density+0.2, eaten, pch=20, col=rgb(0,0,0.5,0.4)))

legend(1,12, c('Large', 'Medium', 'Small'), pch=20, bty = 'n', 
    col=c(rgb(0.5,0,0), rgb(0,0.5,0), rgb(0,0,0.5)))



