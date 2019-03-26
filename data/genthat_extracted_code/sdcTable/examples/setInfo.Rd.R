library(sdcTable)


### Name: setInfo
### Title: set information of 'sdcProblem-class'- or
###   'problemInstance-class' objects
### Aliases: setInfo

### ** Examples

# load primary suppressed data (created in the example of \code{primarySuppression})
sp <- searchpaths()
fn <- paste(sp[grep("sdcTable", sp)], "/data/problemWithSupps.RData", sep="")
problem <- get(load(fn))

# which is the overall total?
index.tot <- which.max(getInfo(problem, 'freq'))
index.tot

# we see that the cell with index.tot==1 is the overall total and its
# anonymization state of the total can be extracted as follows:
print(getInfo(problem, type='sdcStatus')[index.tot])

# we want this cell to never be suppressed
problem <- setInfo(problem, type='sdcStatus', index=index.tot, input='z')

# we can verify this:
print(getInfo(problem, type='sdcStatus')[index.tot])

# changing slot 'UPL' for all cells
inp <- data.frame(strID=getInfo(problem,'strID'), UPL_old=getInfo(problem,'UPL'))
inp$UPL_new <- inp$UPL_old+1
problem <- setInfo(problem, type='UPL', index=1:nrow(inp), input=inp$UPL_new)




