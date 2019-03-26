library(WrightMap)


### Name: wrightMap
### Title: wrightMap: item-person maps
### Aliases: wrightMap plot.CQmodel

### ** Examples


# Plotting results of a unidimensional Rasch Model

## Mock results
  uni.proficiency <- rnorm(1000, mean =  -0.5, sd = 1)
  difficulties  <- sort( rnorm( 20))

## Default map
wrightMap( uni.proficiency, difficulties)

## Density version
wrightMap( uni.proficiency, difficulties, person.side = personDens)


# Plotting results of a multidimensional Rasch Model

## Mock results
  multi.proficiency <- data.frame(
    d1 = rnorm(1000, mean =  -0.5, sd = 1),
    d2 = rnorm(1000, mean =   0.0, sd = 1),
    d3 = rnorm(1000, mean =  +0.5, sd = 1))

  difficulties  <- sort( rnorm( 20))

dev.new(width=10, height=10)
wrightMap( multi.proficiency, difficulties)

# Plotting results of a unidimensional Rating Scale Model

## Mock results
  uni.proficiency <- rnorm(1000, mean =  -0.5, sd = 1)

  items.loc <- sort( rnorm( 20))
  thresholds <- data.frame(
    l1 = items.loc - 0.5 ,
    l2 = items.loc - 0.25,
    l3 = items.loc + 0.25,
    l4 = items.loc + 0.5)

wrightMap( uni.proficiency, thresholds)


  
    ####ConQuest integration###
  
  	fpath <- system.file("extdata", package="WrightMap")
  	
  	#Partial credit model:

	model1 <- CQmodel(p.est = file.path(fpath,"ex2.eap"), show = file.path(fpath,"ex2.shw"))
	wrightMap(model1) 
	
	# Rating scale model:
	model2 <- CQmodel(file.path(fpath,"ex2b.eap"), file.path(fpath,"ex2b-2.shw"))
	wrightMap(model2, label.items.row = 2) 
		
  # Complex model
	model3 <- CQmodel(file.path(fpath,"ex4a.mle"), file.path(fpath,"ex4a.shw")) 
	wrightMap(model3, min.logit.pad = -29, person.side = personDens)
	
	
  ### Skip CQmodel
	wrightMap(file.path(fpath,"ex2a.eap"), file.path(fpath,"ex2a.shw"), 
  label.items.row = 3) 




