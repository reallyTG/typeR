library(geozoning)


### Name: genData
### Title: generate data
### Aliases: genData

### ** Examples

# simulate data with Gaussian model
resGene=genData(NULL,10,450,"Gau",5,0.2,8,0,list(x=c(0,0,1,1,0),y=c(0,1,1,0,0)),FALSE)
plot(resGene$tabData)



