library(TeachingDemos)


### Name: spread.labs
### Title: Spread out close points for labeling in plots
### Aliases: spread.labs
### Keywords: dplot

### ** Examples

# overlapping labels
plot(as.integer(state.region), state.x77[,1], ylab='Population',
	xlab='Region',xlim=c(1,4.75), xaxt='n')
axis(1, at=1:4, lab=levels(state.region) )

text( as.integer(state.region)+.5, state.x77[,1], state.abb )
segments( as.integer(state.region)+0.025, state.x77[,1],
		as.integer(state.region)+.375, state.x77[,1] )

# now lets redo the plot without overlap

tmp.y <- state.x77[,1]
for(i in levels(state.region) ) {
  tmp <- state.region == i
  tmp.y[ tmp ] <- spread.labs( tmp.y[ tmp ], 1.2*strheight('A'),
	maxiter=1000, min=0 )
}

plot(as.integer(state.region), state.x77[,1], ylab='Population',
	xlab='Region', xlim=c(1,4.75), xaxt='n')
axis(1, at=1:4, lab=levels(state.region) )

text( as.integer(state.region)+0.5, tmp.y, state.abb )
segments( as.integer(state.region)+0.025, state.x77[,1],
		as.integer(state.region)+0.375, tmp.y )



