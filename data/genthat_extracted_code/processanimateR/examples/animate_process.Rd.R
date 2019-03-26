library(processanimateR)


### Name: animate_process
### Title: Animate cases on a process map
### Aliases: animate_process

### ** Examples

data(example_log)

# Animate the process with default options (absolute time and 60s duration)
animate_process(example_log)
## No test: 
# Animate the process with default options (relative time, with jitter, infinite repeat)
animate_process(example_log, mode = "relative", jitter = 10, repeat_count = Inf)
## End(No test)




