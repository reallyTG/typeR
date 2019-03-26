library(Ritc)


### Name: fititcdata
### Title: Fit and plot ITC data
### Aliases: fititcdata
### Keywords: Isothermal Titration Calorimetry (ITC) regression

### ** Examples

data(data_inputparam1);
data(data_origin1);

## using the loaded data to generate the input parameter file
write.table(data_inputparam1, "inputparam2.txt", quote=FALSE, 
col.names=FALSE, row.names=FALSE, sep=", ");

## using the loaded data to generate an Origin7 data file as input
write.csv(data_origin1, "B110711CD4.CSV", quote=FALSE, row.names=FALSE)

## perform fitting 
param0 <- fititcdata(x = "inputparam2.txt", y = "itcout");



