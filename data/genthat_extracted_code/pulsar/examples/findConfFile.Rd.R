library(pulsar)


### Name: findConfFile
### Title: find config file
### Aliases: findConfFile

### ** Examples

## Default config file provided by pulsar runs code in interactive mode
## This is for testing purposes and executes serially.
findConfFile()
## Use the parallel package
## slower than providing the 'ncores' argument to pulsar function, due to
## the overhead of creating the batchtools registry.
findConfFile('parallel')

## Use the snow package to register/execute batch jobs on socket clusters.
findConfFile('snow')
## Use a TORQUE / PBS queing system. Requires brew template file.
findConfFile('torque')
findTemplateFile('simpletorque')




