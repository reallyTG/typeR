library(RRphylo)


### Name: plotRates
### Title: Plot RRphylo rates at a specified node
### Aliases: plotRates

### ** Examples

data("DataApes")
DataApes$PCstage->PCstage
DataApes$Tstage->Tstage

## No test: 
RRphylo(tree=Tstage,y=PCstage)->RR

plotRates(RR,node=72,foldername=tempdir(),export.tiff = TRUE)
## End(No test)



