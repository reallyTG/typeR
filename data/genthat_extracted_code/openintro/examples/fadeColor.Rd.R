library(openintro)


### Name: fadeColor
### Title: Fade colors
### Aliases: fadeColor

### ** Examples

data(marioKart)
new  <- marioKart$cond == 'new'
used <- marioKart$cond == 'used'

par(mfrow=1:2)

#===> color numbers <===#
dotPlot(marioKart$totalPr[new], ylim=c(0,3), xlim=c(25, 80), pch=20,
	col=2, cex=2, main='using regular colors')
dotPlot(marioKart$totalPr[used], at=2, add=TRUE, col=4, pch=20, cex=2)
dotPlot(marioKart$totalPr[new], ylim=c(0,3), xlim=c(25, 80),
	col=fadeColor(2, '22'), pch=20, cex=2,
	main='fading the colors first')
dotPlot(marioKart$totalPr[used], at=2, add=TRUE,
	col=fadeColor(4, '22'), pch=20, cex=2)

#===> color names <===#
dotPlot(marioKart$totalPr[new], ylim=c(0,3), xlim=c(25, 80), pch=20,
	col='red', cex=2, main='using regular colors')
dotPlot(marioKart$totalPr[used], at=2, add=TRUE, col='blue', pch=20, cex=2)
dotPlot(marioKart$totalPr[new], ylim=c(0,3), xlim=c(25, 80),
	col=fadeColor('red', '22'), pch=20, cex=2,
	main='fading the colors first')
dotPlot(marioKart$totalPr[used], at=2, add=TRUE,
	col=fadeColor('blue', '22'), pch=20, cex=2)

#===> hexadecimal <===#
dotPlot(marioKart$totalPr[new], ylim=c(0,3), xlim=c(25, 80), pch=20,
	col='#FF0000', cex=2, main='using regular colors')
dotPlot(marioKart$totalPr[used], at=2, add=TRUE, col='#0000FF', pch=20,
	cex=2)
dotPlot(marioKart$totalPr[new], ylim=c(0,3), xlim=c(25, 80),
	col=fadeColor('#FF0000', '22'), pch=20, cex=2,
	main='fading the colors first')
dotPlot(marioKart$totalPr[used], at=2, add=TRUE,
	col=fadeColor('#0000FF', '22'), pch=20, cex=2)

#===> alternative: rgb function <===#
dotPlot(marioKart$totalPr[new], ylim=c(0,3), xlim=c(25, 80), pch=20,
	col=rgb(1,0,0), cex=2, main='using regular colors')
dotPlot(marioKart$totalPr[used], at=2, add=TRUE, col=rgb(0,0,1),
	pch=20, cex=2)
dotPlot(marioKart$totalPr[new], ylim=c(0,3), xlim=c(25, 80),
	col=rgb(1,0,0,1/8), pch=20, cex=2,
	main='fading the colors first')
dotPlot(marioKart$totalPr[used], at=2, add=TRUE,
	col=rgb(0,0,1,1/8), pch=20, cex=2)



