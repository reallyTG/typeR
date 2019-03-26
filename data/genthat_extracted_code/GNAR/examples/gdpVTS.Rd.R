library(GNAR)


### Name: gdpVTS
### Title: Differenced GDP values for 35 countries
### Aliases: gdpVTS

### ** Examples

data(gdp)
#Plot using 'ts' S3 function, can only plot up to 10 columns at once
plot(gdpVTS[,1:5])

#Plot as heatmap
image(gdpVTS)



