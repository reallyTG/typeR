library(phenmod)


### Name: result.pic.maps
### Title: Map creation
### Aliases: result.pic.maps

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
			interpolate=TRUE, silent=FALSE)

  ## not enough successfully calculated budbursts
  ## replace with examples
  result.values$doy.model <- round(rnorm(n=9,mean=100,sd=20))
  result.values$doy.observed <- round(rnorm(n=9,mean=100,sd=20))

  ## create maps
  result.pic.maps(values=result.values, 
		picPath=getwd(), picName="beech_budburst", 
		silent=FALSE, createFile=FALSE)



