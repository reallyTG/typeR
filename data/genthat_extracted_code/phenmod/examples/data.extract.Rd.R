library(phenmod)


### Name: data.extract
### Title: Essential data extraction.
### Aliases: data.extract

### ** Examples

  ## load budburst observations (extracted via 'data.read.phase')
  data(bbObs)
  ## load leafcolouring observations (extracted via 'data.read.phase')
  data(lcObs)

  ## extract essential data
  data.extracted <- data.extract(data.budburst=bbObs, 
				data.leafcolouring=lcObs, 
				out2File=FALSE)



