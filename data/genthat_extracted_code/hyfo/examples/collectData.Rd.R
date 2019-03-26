library(hyfo)


### Name: collectData
### Title: Collect data from different csv files.
### Aliases: collectData

### ** Examples


#use internal data as an example.
folder <- file.path(path.package("hyfo"), 'extdata')
# file may vary with different environment, it if doesn't work, use local way to get
# folder path.

a <- collectData(folder, fileType = 'csv', range = c(10, 20, 1,2))

# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




