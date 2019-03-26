library(pBrackets)


### Name: grid.brackets
### Title: Add brackets to a grid pannel.
### Aliases: grid.brackets
### Keywords: braces brackets

### ** Examples


library(grid)
grid.newpage()
pushViewport(plotViewport(margins=c(0.5, 0.5, 0.5, 0.5), xscale = c(-1, 21), yscale = c(-1, 21)))
grid.grill(h=unit(seq(0,20),'native'), v=unit(seq(0,7),'native'), gp=gpar(col=rgb(0.8, 0.9, 0.95)))

grid.brackets(0, 18, 7, 20, lwd=2)
grid.text(x=unit(8, 'native'), y=unit(20, 'native'), label=expression(paste(bold('Braces:'),
' default')), hjust = 0, vjust=0)

grid.brackets(0, 16, 7, 18, lwd=2, curvatur=1, type=2)
grid.text(x=unit(8, 'native'), y=unit(18, 'native'), label=expression(paste(bold('Braces 2:'),
' curvatur=1, type=2')), hjust = 0, vjust=0)

grid.brackets(0, 14, 7, 16, lwd=2, ticks=NA, curvatur=1, type=5)
grid.text(x=unit(8, 'native'), y=unit(16, 'native'), label=expression(paste(bold('Parentheses:'),
' ticks=NA, curvature=1, type=5')), hjust = 0, vjust=0)

grid.brackets(0, 12, 7, 14, lwd=2, ticks=NA, type=4, h=0.03)
grid.text(x=unit(8,'native'), y=unit(14,'native'), label=expression(paste(bold('Square brackets:'),
' ticks=NA, type=4')), hjust = 0, vjust=0)

grid.brackets(0, 10, 7, 12, lwd=2, ticks=NA, curvature=1, type=3)
grid.text(x=unit(8, 'native'), y=unit(12, 'native'), label=expression(paste(bold('Chevrons:'),
' ticks=NA, curvature=1, type=3')), hjust = 0, vjust=0)

grid.brackets(0, 8, 7, 10, lwd=2, ticks=NA, type=3, curvature=0.2, h=0.04)
grid.text(x=unit(8, 'native'), y=unit(10, 'native'), label=expression(paste(bold('Stump brackets:'),
' ticks=NA, curvature=0.2, type=3')), hjust = 0, vjust=0)

grid.brackets(0, 6, 7, 8, lwd=2, type=4)
grid.text(x=unit(8,'native'), y=unit(8,'native'),
label=expression(paste(bold('Square brackets with tick:'), ' type=4')), hjust = 0, vjust=0)

grid.brackets(0, 4, 7, 6, lwd=2, ticks=c(0.25, 0.75))
grid.text(x=unit(8,'native'), y=unit(6,'native'),
label=expression(paste(bold('Double tick braces:'), ' ticks=c(0.25, 0.75)')), hjust = 0, vjust=0)

grid.brackets(0, 2, 7, 4, lwd=2, ticks=-0.5, h=0.03)
grid.text(x=unit(8, 'native'), y=unit(4, 'native'),
label=expression(paste(bold('Negative tick braces:'), ' ticks=-0.5')), hjust = 0, vjust=0)

grid.brackets(0, 0, 7, 2, lwd=2, ticks=c(-0.2, -0.4, -0.6, -0.8, 1), type=4)
grid.text(x=unit(8,'native'), y=unit(2,'native'), label=expression(paste(bold('Multiples ticks:'),
' ticks=c(-0.2,-0.4,-0.6,-0.8, 1), type=4')), hjust = 0, vjust=0)

popViewport()




