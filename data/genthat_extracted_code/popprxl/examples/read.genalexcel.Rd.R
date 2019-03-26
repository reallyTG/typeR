library(popprxl)


### Name: read.genalexcel
### Title: Read GenAlEx formatted data from excel
### Aliases: read.genalexcel

### ** Examples

# Read in the data set nancycats from an example excel file in this
# package.

nancy <- system.file("files/nancycats.xlsx", package = "popprxl")
nancy # This is the address to our excel file.
read.genalexcel(nancy, sheet = 1, genclone = FALSE)

# Note that system.file() is only for examples. You can use
# file.choose() for an interactive way of choosing files.
#
# e.g.
# myfile <- file.choose()
# read.genalexcel(myfile)
## Not run: 
##D nancy_ex_rows <- system.file("files/nancycats_extra_rows.xlsx", package = "popprxl")
##D # This will give a warning
##D read.genalexcel(nancy_ex_cols, sheet = 1, genclone = FALSE)
## End(Not run)



