library(sievetest)


### Name: rrx2x
### Title: Sieve Test Data Object Plot Coordinates Transformation Functions
### Aliases: rrx2x rry2y x2rrx rrx2x y2rry
### Keywords: dplot

### ** Examples

data(lignite)
plot(lignite)
# query for exact x coordinates within the plot
if(interactive()) rrx2x(locator()$x)
# query for exact y coordinates within the plot
if(interactive()) rry2y(locator()$y)
# or 
y2rry(36.78794)
# or
rrx2x(par('usr')[1])



