library(cdata)


### Name: pivot_to_rowrecs
### Title: Move values from rows to columns (pivot).
### Aliases: pivot_to_rowrecs

### ** Examples


  d <- data.frame(meas= c('AUC', 'R2'), val= c(0.6, 0.2))
  pivot_to_rowrecs(d,
                   columnToTakeKeysFrom= 'meas',
                   columnToTakeValuesFrom= 'val',
                   rowKeyColumns= c()) %.>%
     print(.)




