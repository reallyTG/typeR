library(Homeric)


### Name: PlotDoughnut
### Title: Plot doughnut
### Aliases: PlotDoughnut
### Keywords: hplot

### ** Examples

# Six presentations of the same data
v <- c(25, 25, 12.5, 12.5, 25)
names(v) <- LETTERS[1:length(v)]
par(mfrow=c(2, 3), mar=c(0, 0, 0, 0), oma=c(0, 0, 5, 0))
PlotDoughnut(v, centre.text='Doughnut')
PlotDoughnut(v, centre.text='Counter-clockwise', clockwise=FALSE)
PlotDoughnut(v, centre.text=~Origin~at~90^o, origin.degrees=90)
PlotDoughnut(v, centre.text='Half nut', to.degrees=180, origin=-90)
PlotDoughnut(v, centre.text='Side nut', to.degrees=180, origin=0)
PlotDoughnut(v, centre.text='Taken a bite', to.degrees=270, origin=-45,
    clockwise=FALSE, thickness=0.1)
title(main='You doughnut', outer=TRUE, cex.main=3)



