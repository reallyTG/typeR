library(Fgmutils)


### Name: getAnoMedicao
### Title: Get Year Measurement
### Aliases: getAnoMedicao

### ** Examples

column_name_measurement_date <- c("02/2009","02/2010","02/2011","02/2012")
column_name_plot <- c(1,2,3,4)
test <- data.frame(column_name_measurement_date,column_name_plot)
getAnoMedicao(test,"column_name_measurement_date","column_name_plot")



