library(sparkTable)


### Name: reshapeExt
### Title: Reshaping datasets
### Aliases: reshapeExt

### ** Examples

  data(pop,package='sparkTable')
  content <- list(
    function(x) { round(mean(x),2) },
    newSparkBox(), newSparkLine(), newSparkBar(),
    function(x) { round(tail(x,1),2) })
  names(content) <- paste('column',1:5,sep='')
  varType <- rep('value',5)
  pop <- pop[,c('variable','value','time')]
  pop$time <- as.numeric(as.character(pop$time))
  xx <- reshapeExt(pop, varying=list(2))
  x1 <- newSparkTable(xx, content, varType)
  #export(x1, outputType='html', graphNames='o2',filename='t1')



