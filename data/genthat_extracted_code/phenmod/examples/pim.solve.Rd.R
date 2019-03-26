library(phenmod)


### Name: pim.solve
### Title: Promoter-Inhibitor-Model
### Aliases: pim.solve

### ** Examples

  ## load preprocessed data
  data(dataFinal)

  ## set or load params
  params <- c(0, 0.058326, 0.109494, 0.039178, 
			-10.34, -0.89, 18.11,-10.03, 
			28.61, 44.49)

  ## apply model
  result <- pim.solve(params, dataFinal, model.no=11, 
			silent=FALSE, out2File=FALSE)




