library(phenmod)


### Name: result.extract.main
### Title: Essential result extraction
### Aliases: result.extract.main

### ** Examples

  ## load preprocessed data
  data(dataFinal)
  ## load spatial information
  data(relatedGrid)

  ## set or load params
  params <- c(0, 0.058326, 0.109494, 0.039178, 
			-10.34, -0.89, 18.11,-10.03, 
			28.61, 44.49)

  ## apply model
  result <- pim.solve(params, dataFinal, model.no=11, 
			silent=FALSE, out2File=FALSE)
 
  ## extract essential results
  result.values <- result.extract.main(
				mask.grid=relatedGrid, 
				result.grid=result, model="pim", 
				interpolate=FALSE, silent=FALSE)



