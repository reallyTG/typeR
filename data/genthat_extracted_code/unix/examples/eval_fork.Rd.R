library(unix)


### Name: eval_safe
### Title: Safe Evaluation
### Aliases: eval_safe eval_fork

### ** Examples

#Only works on Unix
if(.Platform$OS.type == "unix"){

# works like regular eval:
eval_safe(rnorm(5))

# Exceptions get propagated
test <- function() { doesnotexit() }
tryCatch(eval_safe(test()), error = function(e){
  cat("oh no!", e$message, "\n")
})

# Honor interrupt and timeout, even inside C evaluations
try(eval_safe(svd(matrix(rnorm(1e8), 1e4)), timeout = 2))

# Capture output
outcon <- rawConnection(raw(0), "r+")
eval_safe(print(sessionInfo()), std_out = outcon)
cat(rawToChar(rawConnectionValue(outcon)))
close(outcon)
}



