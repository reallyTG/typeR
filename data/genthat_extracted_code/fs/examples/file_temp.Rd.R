library(fs)


### Name: file_temp
### Title: Create names for temporary files
### Aliases: file_temp file_temp_push file_temp_pop path_temp

### ** Examples

## Don't show: 
file_temp_push("/tmp/filedd461c46df20")
## End(Don't show)

path_temp()
path_temp("does-not-exist")

# default just passes the arguments to `tempfile()`
file_temp()

# But you can also make the results deterministic
file_temp_push(letters)
file_temp()
file_temp()

# Or explicitly remove values
while (!is.null(file_temp_pop())) next
file_temp_pop()



