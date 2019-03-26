library(phenmod)


### Name: tsm.solve
### Title: Temperature-Sum-Model
### Aliases: tsm.solve

### ** Examples

  ## load preprocessed data
  data(dataFinal)

  ## set or load params
  params <- c(0, 100)

  ## apply model
  result <- tsm.solve(params, dataFinal, 
		silent=FALSE, out2File=FALSE)




