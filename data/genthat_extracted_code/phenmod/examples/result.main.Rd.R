library(phenmod)


### Name: result.main
### Title: Result evaluation
### Aliases: result.main

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
  ## evaluate resuts
  result.main(mask.grid=relatedGrid, 
		result.grid=result, plant="beech", model="pim", 
		year="1952-2009", picPath=getwd(), picName="beech-budburst",
		createFiles=FALSE, rsquarePath=getwd(), 
		rsquareFile="rsquare.RData", rsquare.type="cod", 
		silent=FALSE, withOutliers=FALSE)



