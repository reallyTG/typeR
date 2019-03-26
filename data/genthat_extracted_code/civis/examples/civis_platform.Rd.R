library(civis)


### Name: civis_platform
### Title: Evaluate an expression in Civis Platform
### Aliases: civis_platform

### ** Examples

## Not run: 
##D 
##D  plan(civis_platform)
##D 
##D  # Specify required resources, image, and tag.
##D  fut <- future({2 + 2},
##D    required_resources = list(cpu = 1024, memory = 2048),
##D    docker_image_name = "civisanalytics/datascience-r",
##D    docker_image_tag = "2.2.0")
##D 
##D  # Evaluate the future later
##D  fut <- future({2 + 2}, lazy = TRUE)
##D  run(fut)
##D 
##D  # check if a future has resolved
##D  resolved(fut)
##D 
##D  # block until the future resolves, and return the value or throw error
##D  value(fut)
##D 
##D  # cancel the job
##D  cancel(fut)
##D 
##D  # grab the run logs
##D  fetch_logs(fut)
##D 
##D  # handle errors
##D  fut <- future({stop("Error!")})
##D  e <- tryCatch(value(fut), error = function(e) e)
##D  get_error(e)
## End(Not run)




