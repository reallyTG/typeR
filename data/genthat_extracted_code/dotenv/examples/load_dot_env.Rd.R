library(dotenv)


### Name: load_dot_env
### Title: Load environment variables from the specified file
### Aliases: load_dot_env

### ** Examples

# Remove, if it exists
Sys.unsetenv("dotenvexamplefoo")
Sys.getenv("dotenvexamplefoo")

# Load from a file
tmp <- tempfile()
cat("dotenvexamplefoo=bar\n", file = tmp)
load_dot_env(tmp)
Sys.getenv("dotenvexamplefoo")

# Clean up
unlink(tmp)



