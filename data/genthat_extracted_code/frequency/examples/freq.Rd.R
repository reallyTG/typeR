library(frequency)


### Name: freq
### Title: Freq
### Aliases: freq

### ** Examples


# Suppress external output for examples
options(frequency_render = FALSE)

# Create frequency tables for the entire dataset
freq(big5)

# For specific variable/s
freq(big5[5:6])
freq(big5$country)

# Produce a list of tables
out <- freq(big5[8:10])
out[1]

options(frequency_render = TRUE)
## Not run: 
##D # To automatically open html output in your browser use the following option:
##D options(frequency_open_output = TRUE)
##D freq(big5[, c('gender', 'E1')])
##D 
##D # To save the output specify the filename and format
##D freq(big5, file = "mydir/myfile.html")
##D 
##D # Supports label attributes from the package foreign package
##D library(foreign)
##D dat <- read.spss(myfile)
##D freq(dat)
##D # (Note: foreign may drop attributes when using to.data.frame = TRUE)
##D df <- read.spss(myfile, to.data.frame = TRUE)
##D freq(df)
##D 
##D # Also supports label attributes from the haven package
##D library(haven)
##D dat <- read_sav(myfile)
##D freq(dat)
##D 
##D # as well as other data with no label attributes
##D dat <- data.frame(id = 1:3, val = letters[1:3])
##D freq(dat)
##D 
## End(Not run)




