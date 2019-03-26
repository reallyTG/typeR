library(foreach)


### Name: getDoSeqWorkers
### Title: Functions Providing Information on the doSeq Backend
### Aliases: getDoSeqWorkers getDoSeqRegistered getDoSeqName
###   getDoSeqVersion
### Keywords: utilities

### ** Examples

cat(sprintf('%s backend is registered\n',
            if(getDoSeqRegistered()) 'A' else 'No'))
cat(sprintf('Running with %d worker(s)\n', getDoSeqWorkers()))
(name <- getDoSeqName())
(ver <- getDoSeqVersion())
if (getDoSeqRegistered())
  cat(sprintf('Currently using %s [%s]\n', name, ver))



