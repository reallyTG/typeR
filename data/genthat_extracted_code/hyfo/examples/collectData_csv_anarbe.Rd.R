library(hyfo)


### Name: collectData_csv_anarbe
### Title: Collect data from csv for Anarbe case.
### Aliases: collectData_csv_anarbe

### ** Examples


#use internal data as an example.
file <- system.file("extdata", "1999.csv", package = "hyfo")
folder <- strsplit(file, '1999')[[1]][1]
a <- collectData_csv_anarbe(folder)

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




