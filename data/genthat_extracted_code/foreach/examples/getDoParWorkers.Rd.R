library(foreach)


### Name: getDoParWorkers
### Title: Functions Providing Information on the doPar Backend
### Aliases: getDoParWorkers getDoParRegistered getDoParName
###   getDoParVersion
### Keywords: utilities

### ** Examples

cat(sprintf('%s backend is registered\n',
            if(getDoParRegistered()) 'A' else 'No'))
cat(sprintf('Running with %d worker(s)\n', getDoParWorkers()))
(name <- getDoParName())
(ver <- getDoParVersion())
if (getDoParRegistered())
  cat(sprintf('Currently using %s [%s]\n', name, ver))



