library(wrapr)


### Name: buildNameCallback
### Title: Build a custom writeback function that writes state into a user
###   named variable.
### Aliases: buildNameCallback

### ** Examples


# user function
f <- function(i) { (1:10)[[i]] }
# capture last error in variable called "lastError"
writeBack <- buildNameCallback('lastError')
# wrap function with writeBack
df <- DebugFnW(writeBack,f)
# capture error (Note: tryCatch not needed for user code!)
tryCatch(
  df(12),
   error = function(e) { print(e) })
# examine error
str(lastError)
# redo call, perhaps debugging
tryCatch(
 do.call(lastError$fn_name, lastError$args),
   error = function(e) { print(e) })




