library(sdcTable)


### Name: changeCellStatus
### Title: change anonymization status of a specific cell
### Aliases: changeCellStatus

### ** Examples

# load primary suppressed data (as created in the example
# of \code{primarySuppression})
sp <- searchpaths()
fn <- paste(sp[grep("sdcTable", sp)], "/data/problemWithSupps.RData", sep="")
problem <- get(load(fn))

# we want to mark the cell region='D' and gender='male' primary sensitive
characteristics <- c('D', 'male')
varNames <- c('region', 'gender')
verbose <- TRUE
rule <- 'u'

# looking at the distribution of anonymization states before...
print(table(getInfo(problem, 'sdcStatus')))

# setting the specific cell as primary sensitive
problem <- changeCellStatus(problem, characteristics, varNames, rule, verbose)

# having a second look at the anonymization states
print(table(getInfo(problem, 'sdcStatus')))




