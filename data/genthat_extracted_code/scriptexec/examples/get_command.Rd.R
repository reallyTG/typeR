library(scriptexec)


### Name: get_command
### Title: Returns the command and arguments needed to execute the provided
###   script file on the current platform.
### Aliases: get_command

### ** Examples

command_struct <- get_command('myfile.sh')
command <- command_struct$command
cli_args <- command_struct$args



