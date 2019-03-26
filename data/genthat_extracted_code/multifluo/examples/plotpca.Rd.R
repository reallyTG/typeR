library(multifluo)


### Name: plotpca
### Title: Plotting a Principal Component Analysis
### Aliases: plotpca

### ** Examples
data(df.scaled)
resPCA=pca(data=df.scaled[,-1], zone="zone",pixel="pixel")
couleurs=find.colors(rownames(resPCA$IndivCoord)) 
## No test: 
plotpca(x=resPCA)
## End(No test)




