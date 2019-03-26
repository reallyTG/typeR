library(edcc)


### Name: ecoEwma
### Title: Economic design for the EWMA control chart
### Aliases: echEwma ecoEwma

### ** Examples

#Douglas (2009). Statistical quality control: a modern introduction, sixth edition, p470.
## Set w from 0.1 to 1 by 0.1 to catch the trend.
ecoEwma(w=seq(0.1,1,by=0.1),P0=110,P1=10,Cf=50)
#yy = ecoEwma(h = seq(.7,1,by=.01), w = seq(0.8,1,by=.01),k = seq(2.9,3.3, by = 0.01), n = 4:5, P0 = 110, P1 = 10, Cf = 50, contour.plot = TRUE)

##$optimum
##Optimum h Optimum k Optimum n Optimum w       ECH
##  0.81000   2.99000   5.00000   0.95000  10.36482
#contour(yy)



