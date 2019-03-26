library(phenmod)


### Name: result.extract.sub
### Title: Extract values
### Aliases: result.extract.sub

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
 
  ## resolve outlier information
  outliers <- result$outlier.bb + result$outlier.lc
  outliers.na <- which(is.na(outliers)==TRUE)
  outliers[outliers.na] <- rep(0, length(outliers.na))

  mask.grid <- relatedGrid

  ## extract valid modelled values
  values.model <- result.extract.sub(mask.grid=mask.grid, 
				result$doy.bb.pim, result$gk4.x, 
				result$gk4.y, outliers=outliers, 
				silent=FALSE, withOutliers=FALSE)$values



