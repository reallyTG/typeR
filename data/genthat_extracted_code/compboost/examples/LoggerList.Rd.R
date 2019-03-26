library(compboost)


### Name: LoggerList
### Title: Logger list class to collect all loggers
### Aliases: LoggerList

### ** Examples

# Define logger:
log.iters = LoggerIteration$new(TRUE, 100)
log.time = LoggerTime$new(FALSE, 20, "minutes")

# Create logger list:
logger.list = LoggerList$new()

# Register new loggeR:
logger.list$registerLogger("iteration", log.iters)
logger.list$registerLogger("time", log.time)

# Print registered logger:
logger.list$printRegisteredLogger()

# Important: The keys has to be unique:
logger.list$registerLogger("iteration", log.iters)

# Still just two logger:
logger.list$printRegisteredLogger()

# Remove all logger:
logger.list$clearRegisteredLogger()

# Get number of registered logger:
logger.list$getNumberOfRegisteredLogger()




