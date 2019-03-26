library(lattice)


### Name: H_environmental
### Title: Atmospheric environmental conditions in New York City
### Aliases: environmental
### Keywords: datasets

### ** Examples

# Scatter plot matrix with loess lines
splom(~environmental,
  panel=function(x,y){
    panel.xyplot(x,y)
    panel.loess(x,y)
  }
)


# Conditioned plot similar to figure 5.3 from Cleveland
attach(environmental)
Temperature <- equal.count(temperature, 4, 1/2)
Wind <- equal.count(wind, 4, 1/2)
xyplot((ozone^(1/3)) ~ radiation | Temperature * Wind,
  aspect=1,
	prepanel = function(x, y) 
		prepanel.loess(x, y, span = 1),
	panel = function(x, y){
		panel.grid(h = 2, v = 2)
		panel.xyplot(x, y, cex = .5)
		panel.loess(x, y, span = 1)
	},
	xlab = "Solar radiation (langleys)",
	ylab = "Ozone (cube root ppb)")
detach()

# Similar display using the coplot function
with(environmental,{
  coplot((ozone^.33) ~ radiation | temperature * wind,
  number=c(4,4),
  panel = function(x, y, ...) panel.smooth(x, y, span = .8, ...),
  xlab="Solar radiation (langleys)",
  ylab="Ozone (cube root ppb)")
})



