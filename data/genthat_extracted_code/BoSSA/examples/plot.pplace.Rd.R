library(BoSSA)


### Name: plot.pplace
### Title: Plot a pplace or jplace object
### Aliases: plot.pplace plot.jplace

### ** Examples


data(pplace)

### number type
plot(pplace,type="number",main="number")

### color type without and with legend
plot(pplace,type="color",main="color without legend",legend=FALSE)
plot(pplace,type="color",main="color with legend",legend=TRUE)

### fattree type
plot(pplace,type="fattree",main="fattree")

### precise type
plot(pplace,type="precise",main="precise vanilla")
plot(pplace,type="precise",simplify=TRUE,main="precise simplify")

# using the read number information encoded here in the name (if available)
Npplace <- sample(1:100,nrow(pplace$multiclass),replace=TRUE)
# in the following exemple, the dots are too large...
plot(pplace,type="precise",main="precise N",legend=TRUE,N=Npplace,simplify=TRUE)

# using the transfo option to modify dot sizes
# note that placements sizes inferior to 1 won't
# behave properly with log10 as a transformation function.
# In this case, you rather use simplify (all the placement
# will corresponds to at least one sequence).
# Beware that when using the transfo option, 
# the legend does not anymore correspond to the actual placement
# size but to the transform placement size
# (i.e. the transform function applied to the dot size).
# we will use the the log10 function
plot(pplace,type="precise",main="precise log10",
	legend=TRUE,N=Npplace,transfo=log10)
# or without simplify, you can use a custom function
# as transfo that will produce positive sized dots
plot(pplace,type="precise",main="precise custom"
	,legend=TRUE,N=Npplace,transfo=function(X){log10(X+1)})



