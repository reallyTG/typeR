library(metRology)


### Name: youden.plot
### Title: Youden plots
### Aliases: youden.plot youden.plot.default yplot
### Keywords: hplot

### ** Examples

data(chromium)
data(potassium)

( yy <- youden.plot(chromium, main="Chromium") )

#With outlier ID (F based)
youden.plot(chromium, main="Chromium", xlim='a', ylim='a', type='o', p.out=0.95)
	#Note use of xlim="a" etc. to ensure both ellipses and data are included.
	
#Top 5 most distant outliers (5 is also the default)
youden.plot(chromium, main="Chromium", xlim='a', ylim='a', type='o', out.method="n", n.out=5)

#With ellipse principal axes
#(useful to specify asp=1 or the axes will not always appear orthogonal)
youden.plot(chromium, main="Chromium", 
	xlim='a', ylim='a', type='o', p.out=0.99, prinax=TRUE, lty.prinax=2, asp=1.0)

youden.plot(potassium, main="Potassium")

#A different pairs plot ...
panel.youden <- function(x, y, ...) youden.plot(x, y, add=TRUE, type="o", cex=1, pos=1, p.out=0.95)
pairs(chromium, upper.panel=panel.youden)





