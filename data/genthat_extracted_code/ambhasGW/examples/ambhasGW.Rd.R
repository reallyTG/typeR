library(ambhasGW)


### Name: ambhasGW
### Title: Ground Water Modelling
### Aliases: ambhasGW

### ** Examples


# Create necessary input file to make dummy run
# Dummy directory to run
dummy.dir <- tempdir()

# Make dummy run
create_inputs(dummy.dir)
input.file <- file.path(dummy.dir , 'input/parameters.yml')
ambhasGW(input.file)




