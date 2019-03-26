library(GSIF)


### Name: soil.legends
### Title: Standard color palettes for soil properties and classes
### Aliases: soil.legends soil.dom soil.vars makeSAGAlegend
### Keywords: datasets

### ** Examples

data(soil.legends)
pal <- soil.legends$ORCDRC$COLOR
names(pal) <- signif((soil.legends$ORCDRC$MAX + 
    soil.legends$ORCDRC$MIN)/2, 3)
pal
data(soil.vars)
soil.vars[soil.vars$varname=="ORCDRC",]
## make SAGA GIS palette:
makeSAGAlegend(x=as.factor(names(pal)), col_pal=pal, 
    filename="ORCDRC.txt")



