library(asdreader)


### Name: get_spectra
### Title: Reads ASD files
### Aliases: get_spectra

### ** Examples


# Get the path to the demo file

asd_fn <- asd_file()
print(asd_fn)

# Example with one file name

m1 <- get_spectra(asd_fn)
matplot(t(m1), type = 'l')

# Example with a vector of file names

asd_fns <- rep(asd_fn, times = 4)
print(asd_fns) # (in this case, 4 times the same file)

m2 <- get_spectra(asd_fns)
matplot(t(m2), type = 'l')




