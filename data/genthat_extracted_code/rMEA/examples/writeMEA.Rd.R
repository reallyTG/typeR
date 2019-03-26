library(rMEA)


### Name: writeMEA
### Title: Exports analyzed MEA data to .txt files
### Aliases: writeMEA

### ** Examples

## No test: 
## This example is excluded from test as it takes more than 10s to run
## define a regex filter for the filenames to be read
to_read = c("20[123]_*")

## read the first 4 minutes of the files
path_normal <- system.file("extdata/normal", package = "rMEA")
mea_normal <- readMEA(path_normal, namefilt = to_read, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist",
                     idOrder = c("id","session"), idSep = "_",  skip = 1, nrow = 6000)

## perform ccf analysis
mea_ccf = MEAccf(mea_normal, lagSec = 5, winSec = 60, incSec = 30, r2Z = TRUE, ABS = TRUE)

## export data and analysis
save_path = tempdir()
writeMEA(mea_ccf, save.directory = save_path, mea_data = TRUE, ccf_data = TRUE)
## End(No test)



