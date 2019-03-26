library(titan)


### Name: titan
### Title: Titration Analysis
### Aliases: titan
### Keywords: misc

### ** Examples

data(hypoxia)

# Analyze titration series using GUI (code not run):
#
# t1 <- titan(data = hypoxia, R=0)

# Perform an identical reanalysis without using GUI:
#
# first get previous options
#
opt <- list(data = hypoxia, R=0)
#
# adjust the options so that
# no further data points are flagged
#
opt$flagRaw <- FALSE
opt$flagFitted <- FALSE
#
# turn off GUI
#
opt$widget <- FALSE
#
# call function
t2 <- do.call( "titan", opt )

# Reanalyze data with different parameters:
#
opt$reg <- "robust"
opt$sel <- "wald"
t3 <- do.call( "titan", opt )



