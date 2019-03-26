library(drake)


### Name: shell_file
### Title: Write an example 'shell.sh' file required by 'make(...,
###   parallelism = 'Makefile', prepend = 'SHELL=./shell.sh')'.
### Aliases: shell_file

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D # Write shell.sh to your working directory.
##D # Read the high-performance computing chapter
##D # (https://ropenscilabs.github.io/drake-manual/hpc.html)
##D # to learn how it is used
##D # in Makefile parallelism.
##D shell_file()
##D })
## End(Not run)



