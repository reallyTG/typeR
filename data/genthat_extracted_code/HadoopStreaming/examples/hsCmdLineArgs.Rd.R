library(HadoopStreaming)


### Name: hsCmdLineArgs
### Title: Handles command line arguments for Hadoop streaming tasks
### Aliases: hsCmdLineArgs

### ** Examples

spec = c('myChunkSize','C',1,"numeric","Number of lines to read at once, a la scan.",-1)
## Displays the help string
hsCmdLineArgs(spec, args=c('-h'))
## Call with the mapper flag, and request that connections be opened
opts = hsCmdLineArgs(spec, openConnections=TRUE,args=c('-m'))
opts  #   a list of argument values
opts$incon # an input connection
opts$outcon # an output connection



