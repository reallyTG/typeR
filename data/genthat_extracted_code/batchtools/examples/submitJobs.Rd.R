library(batchtools)


### Name: submitJobs
### Title: Submit Jobs to the Batch Systems
### Aliases: submitJobs

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(3) 
## End(Don't show)
### Example 1: Submit subsets of jobs
tmp = makeRegistry(file.dir = NA, make.default = FALSE)

# toy function which fails if x is even and an input file does not exists
fun = function(x, fn) if (x %% 2 == 0 && !file.exists(fn)) stop("file not found") else x

# define jobs via batchMap
fn = tempfile()
ids = batchMap(fun, 1:20, reg = tmp, fn = fn)

# submit some jobs
ids = 1:10
submitJobs(ids, reg = tmp)
waitForJobs(ids, reg = tmp)
getStatus(reg = tmp)

# create the required file and re-submit failed jobs
file.create(fn)
submitJobs(findErrors(ids, reg = tmp), reg = tmp)
getStatus(reg = tmp)

# submit remaining jobs which have not yet been submitted
ids = findNotSubmitted(reg = tmp)
submitJobs(ids, reg = tmp)
getStatus(reg = tmp)

# collect results
reduceResultsList(reg = tmp)

### Example 2: Using memory measurement
tmp = makeRegistry(file.dir = NA, make.default = FALSE)

# Toy function which creates a large matrix and returns the column sums
fun = function(n, p) colMeans(matrix(runif(n*p), n, p))

# Arguments to fun:
args = CJ(n = c(1e4, 1e5), p = c(10, 50)) # like expand.grid()
print(args)

# Map function to create jobs
ids = batchMap(fun, args = args, reg = tmp)

# Set resources: enable memory measurement
res = list(measure.memory = TRUE)

# Submit jobs using the currently configured cluster functions
submitJobs(ids, resources = res, reg = tmp)

# Retrive information about memory, combine with parameters
info = ijoin(getJobStatus(reg = tmp)[, .(job.id, mem.used)], getJobPars(reg = tmp))
print(unwrap(info))

# Combine job info with results -> each job is aggregated using mean()
unwrap(ijoin(info, reduceResultsDataTable(fun = function(res) list(res = mean(res)), reg = tmp)))

### Example 3: Multicore execution on the slave
tmp = makeRegistry(file.dir = NA, make.default = FALSE)

# Function which sleeps 10 seconds, i-times
f = function(i) {
  parallelMap::parallelMap(Sys.sleep, rep(10, i))
}

# Create one job with parameter i=4
ids = batchMap(f, i = 4, reg = tmp)

# Set resources: Use parallelMap in multicore mode with 4 CPUs
# batchtools internally loads the namespace of parallelMap and then
# calls parallelStart() before the job and parallelStop() right
# after the job last job in the chunk terminated.
res = list(pm.backend = "multicore", ncpus = 4)

## Not run: 
##D # Submit both jobs and wait for them
##D submitJobs(resources = res, reg = tmp)
##D waitForJobs(reg = tmp)
##D 
##D # If successfull, the running time should be ~10s
##D getJobTable(reg = tmp)[, .(job.id, time.running)]
##D 
##D # There should also be a note in the log:
##D grepLogs(pattern = "parallelMap", reg = tmp)
## End(Not run)



