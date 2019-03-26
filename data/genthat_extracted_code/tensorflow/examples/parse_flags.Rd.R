library(tensorflow)


### Name: parse_flags
### Title: Parse Configuration Flags for a TensorFlow Application
### Aliases: parse_flags

### ** Examples

## Not run: 
##D # examine an example configuration file provided by tensorflow
##D file <- system.file("examples/config/flags.yml", package = "tensorflow")
##D cat(readLines(file), sep = "\n")
##D 
##D # read the default configuration
##D FLAGS <- tensorflow::parse_flags("default", file = file)
##D str(FLAGS)
##D 
##D # read the alternate configuration: note that
##D # the default configuration is inherited, but
##D # we override the 'string' configuration here
##D FLAGS <- tensorflow::parse_flags("alternate", file = file)
##D str(FLAGS)
##D 
##D # override configuration values using command
##D # line arguments (normally, these would be
##D # passed in through the command line invocation
##D # used to start the process)
##D FLAGS <- tensorflow::parse_flags(
##D   "alternate",
##D   file = file,
##D   arguments = c("--foo=1")
##D )
##D str(FLAGS)
##D 
## End(Not run)



