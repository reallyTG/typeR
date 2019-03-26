library(Ritc)


### Name: importorigin
### Title: Import data from Origin7 ITC data sheet
### Aliases: importorigin
### Keywords: Isothermal Titration Calorimetry (ITC)

### ** Examples

data(data_origin1);

## using the loaded data to generate an Origin7 data file as input
write.csv(data_origin1, "origin_data.csv", quote=FALSE, row.names=FALSE)

## import data
x1 <- importorigin("origin_data.csv");



