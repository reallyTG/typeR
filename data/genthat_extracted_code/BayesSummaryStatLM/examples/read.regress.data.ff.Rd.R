library(BayesSummaryStatLM)


### Name: read.regress.data.ff
### Title: Read in Tabulated Data and Compute Summary Statistics
### Aliases: read.regress.data.ff
### Keywords: multilinear regression

### ** Examples

# The package includes several example data files, illustrated here.

###########
# Example 1
###########
# The following command finds the location of the data file
# that includes 4 predictor variables and 20,000 simulated data values.

filename <- system.file('data/regressiondata.nz.all.csv.gz', package='BayesSummaryStatLM')

# The file is formatted so that the simulated response variable is in the
# first column, and columns 2 to 5 contain simulated predictor variables.
# The simulated coefficients are: beta <- c(0.76, -0.92, 0.64, 0.57, -1.65), 
# where the first value is the y-intercept term in the Bayesian linear 
# regression model.  The sigma-squared term, i.e. the variance of the normally 
# distributed error terms, is simulated as: sigmasq <- 0.25

## Next, read the data and compute the summary statistics using the
# "read.regress.data.ff()" function.  By default, the first column is assumed 
# to be the response variable, and the remaining columns are assumed to contain
# predictor variable values.  The function will check if the file exists and 
# can be read.

data.values <- read.regress.data.ff(filename)
data.values

###########
# Example 2
###########
## Several files can be given in a list to be read sequentially, as follows.

filenames <- list(
  system.file('data/regressiondata.nz.pt1.csv.gz', package='BayesSummaryStatLM'),
  system.file('data/regressiondata.nz.pt2.csv.gz', package='BayesSummaryStatLM')
)
data.values <- read.regress.data.ff(filenames)
data.values

# The above results can be compared to the "data.values" obtained previously.  They 
# are the same, since the current files are just copies of the same data split
# between two files.

###########
# Example 3
###########
## The two files can be read progressively through time, and the summary statistics 
# are then updated with data in each file, as follows.

filenames <- list(
  system.file('data/regressiondata.nz.pt1.csv.gz', package='BayesSummaryStatLM'),
  system.file('data/regressiondata.nz.pt2.csv.gz', package='BayesSummaryStatLM')
)
data.values <- read.regress.data.ff(filenames[[1]])
data.values
data.values2 <- read.regress.data.ff(filenames[[2]], update.summaries = data.values)
data.values2

###########
# Example 4
###########
## If not all columns are to be used in regression analysis, one can specify
# which columns to use in the "predictor.cols" and "response.col" options;
# the order of "predictor.cols" can also be changed.  The following command 
# reads in predictors from a subset of 3 columns, and changes their order.

filename <- system.file('data/regressiondata.nz.all.csv.gz', package='BayesSummaryStatLM')
data.values <- read.regress.data.ff(filename, predictor.cols=c(4,2,3), response.col=5)
data.values

###########
# Example 5
###########
## If the R session must be terminated, the summary statistics can be saved and then 
# loaded using standard methods in R, as follows:

filenames <- list(
  system.file('data/regressiondata.nz.pt1.csv.gz', package='BayesSummaryStatLM'),
  system.file('data/regressiondata.nz.pt2.csv.gz', package='BayesSummaryStatLM')
)
data.values <- read.regress.data.ff(filenames[[1]])

tmpfname <- tempfile()
save(data.values, file = tmpfname)
rm(data.values)

# Now the R session can be terminated.  Note that the filename "tmpfname"
# must be recorded so that it can be used for updating in a later R session.
# Upon starting a new R session, the state of the previously-calculated
# summary statistics in the file named "tmpfname" can be restored and 
# then updated, as follows:

load(tmpfname)
unlink(tmpfname)

# If a new portion of a data set arrives, the summary statistics are updated
# as follows:

data.values2 <- read.regress.data.ff(filenames[[2]], update.summaries = data.values)
data.values2



