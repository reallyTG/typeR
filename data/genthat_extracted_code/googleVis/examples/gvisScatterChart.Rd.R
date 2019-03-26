library(googleVis)


### Name: gvisScatterChart
### Title: Google Scatter Chart with R
### Aliases: gvisScatterChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.


## Scatter chart
Scatter1 <- gvisScatterChart(women)
plot(Scatter1)

## Using optional arguments
Scatter2 <- gvisScatterChart(women, options=list(legend="none",
                 lineWidth=2, pointSize=2,
                 title="Women", vAxis="{title:'weight (lbs)'}",
                 crosshair="{ trigger: 'both' }", 
                 hAxis="{title:'height (in)'}", width=500, height=400))
                 
plot(Scatter2)


df=data.frame(x=sin(1:100/3), 
              Circle=cos(1:100/3), 
 	      Ellipse=cos(1:100/3)*0.5)

## Plot several variables as smooth curves
Scatter3 <- gvisScatterChart(df, 
	    		options=list(curveType='function', 
				     pointSize=0, 
				     lineWidth=2))
plot(Scatter3)

## Two series in the same plot with different
## x-values
df <- data.frame(x=c(2,2,1,3,4),
                 y1=c(0,3,NA,NA,NA),
                 y2=c(NA,NA,0,3,2))
Scatter4 <- gvisScatterChart(df,
                             options=list(lineWidth=2,
                                          pointSize=2))
plot(Scatter4)

## Customize points
M <- matrix(nrow=6,ncol=6)
M[col(M)==row(M)] <- 1:6
dat <- data.frame(X=1:6, M)
SC <- gvisScatterChart(dat, 
                        options=list(
                        title="Customizing points",
                        legend="right",
                        pointSize=30,
                        series="{
                             0: { pointShape: 'circle' },
                             1: { pointShape: 'triangle' },
                             2: { pointShape: 'square' },
                             3: { pointShape: 'diamond' },
                             4: { pointShape: 'star' },
                             5: { pointShape: 'polygon' }
                             }"))
plot(SC)




