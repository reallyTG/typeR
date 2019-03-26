library(WrightMap)


### Name: item.side
### Title: Wright Map item sides
### Aliases: item.side itemClassic itemModern itemHist

### ** Examples

	
	#As a call from wrightMap:

  ## Mock results
  uni.proficiency <- rnorm(1000, mean =  -0.5, sd = 1)

  items.loc <- sort( rnorm( 20))
  thresholds <- data.frame(
    l1 = items.loc - 0.5 ,
    l2 = items.loc - 0.25,
    l3 = items.loc + 0.25,
    l4 = items.loc + 0.5)
	
	## Setting up labels, colors and symbols

  thresholds.labels <- data.frame(
    l1 = paste('Lev',rep(1,20),sep = ''),
    l2 = paste('Lev',rep(2,20),sep = ''),
    l3 = paste('Lev',rep(3,20),sep = ''),
    l4 = paste('Lev',rep(4,20),sep = ''))

  thresholds.colors <- data.frame(
    l1 = rep(  'green',20),
    l2 = rep(    'red',20),
    l3 = rep( 'yellow',20),
    l4 = rep(   'blue',20))

  thresholds.symbols <- data.frame(
    l1 = rep( 15,20),
    l2 = rep( 16,20),
    l3 = rep( 17,20),
    l4 = rep( 18,20))

wrightMap( uni.proficiency, thresholds
  , thr.lab.text = thresholds.labels
  , thr.lab.col = thresholds.colors
  , thr.sym.pch = thresholds.symbols
  )
	
	#As  direct call:
	
	## Plotting results of a unidimensional Rating Scale Model

  items.loc <- sort( rnorm( 20))
  thresholds <- data.frame(
    l1 = items.loc - 0.5 ,
    l2 = items.loc - 0.25,
    l3 = items.loc + 0.25,
    l4 = items.loc + 0.5)

	itemModern(thresholds)
	itemClassic(thresholds)
	itemHist(thresholds)
	
	## Plotting ConQuest results
	
	fpath <- system.file("extdata", package="WrightMap")
	model1 <- CQmodel(file.path(fpath,"ex2a.eap"), file.path(fpath,"ex2a.shw"))
	m1.item <- itemData(model1)
	
  #control of oma allows us to give more space to longer item names
	itemModern(m1.item, label.items.srt= 90, oma = c(3,0,0,3)) 
	itemClassic(m1.item)
	itemHist(m1.item)
	
	## Creating a Wright Map with item side on the left
	
	 multi.proficiency <- data.frame(
    d1 = rnorm(1000, mean =  -0.5, sd = 1),
    d2 = rnorm(1000, mean =   0.0, sd = 1),
    d3 = rnorm(1000, mean =  +0.5, sd = 1))

    # split.screen: Set up a split screen with the left side 80 percent of the screen
    # yRange = c(-3,4): Set the yRange to be the same for both sides
    # axis.logits.side = "L": Move the item logit axis to the left
    # oma = c(0,0,0,2): Adjust the spacing between the graphs
    # mtext("Wright Map", side = 3, font = 2, line = 1): add a title
    # screen(2): Start drawing on the second screen
    
    split.screen(figs = matrix(c(0,.8,0,1,.8,1,0,1),ncol = 4, byrow = TRUE)) 
    itemModern(thresholds, yRange = c(-3,4), show.axis.logits = "L", oma = c(0,0,0,2))
    mtext("Wright Map", side = 3, font = 2, line = 1)
    screen(2)
    personHist(multi.proficiency, axis.persons = "",yRange = c(-3,4)
    , axis.logits = "Persons", show.axis.logits = FALSE)
    
    
    ## Creating a multidimensional Wright Map with each dimension separate
    
    ## Mock results
  
    d1 = rnorm(1000, mean =  -0.5, sd = 1)
    d2 = rnorm(1000, mean =   0.0, sd = 1)

	dim1.diff <- rnorm(5)
	dim2.diff <- rnorm(5)

  dev.new(width=10, height=10)
	split.screen(figs = matrix(c(0,.1,0,1,
  								.12,.6,0,1,
  								.5,.6,0,1,
  								.5,1,0,1),ncol = 4,byrow = TRUE))
  

	personDens(d1,yRange = c(-3,3),show.axis.logits = FALSE,axis.logits = "")
	screen(2)
	itemModern(dim1.diff,yRange = c(-3,3),show.axis.logits = FALSE)
	mtext("Wright Map", side = 3, font = 2, line = 1)
	screen(3)
	personDens(d2,yRange = c(-3,3),show.axis.logits = FALSE,axis.logits = ""
  ,axis.persons = "",dim.names = "Dim2")
	screen(4)
	itemModern(dim2.diff,yRange = c(-3,3),show.axis.logits = FALSE
  ,label.items = paste("Item",6:10))
	
	

	



