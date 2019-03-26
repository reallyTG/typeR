library(WrightMap)


### Name: person.side
### Title: Wright Map person sides
### Aliases: person.side personHist personDens

### ** Examples

	
	# Creating a Wright Map with item side on the left
	
	multi.proficiency <- data.frame(
    d1 = rnorm(1000, mean =  -0.5, sd = 1),
    d2 = rnorm(1000, mean =   0.0, sd = 1),
    d3 = rnorm(1000, mean =  +0.5, sd = 1))

    
  items.loc <- sort( rnorm( 20))
  thresholds <- data.frame(
    l1 = items.loc - 0.5 ,
    l2 = items.loc - 0.25,
    l3 = items.loc + 0.25,
    l4 = items.loc + 0.5)
    
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
  
	split.screen(figs = matrix(c(0,.1,0,1,
  								.12,.6,0,1,
  								.5,.6,0,1,
  								.5,1,0,1),ncol = 4,byrow = TRUE))
  							  
	personDens(d1,yRange = c(-3,3),show.axis.logits = FALSE
  , axis.logits = "")
	screen(2)
	itemModern(dim1.diff,yRange = c(-3,3),show.axis.logits = FALSE)
	mtext("Wright Map", side = 3, font = 2, line = 1)
	screen(3)
	personDens(d2,yRange = c(-3,3),show.axis.logits = FALSE
  , axis.logits = ""
  , axis.persons = "",dim.names = "Dim2")
	screen(4)
	itemModern(dim2.diff,yRange = c(-3,3),show.axis.logits = FALSE
  , label.items = paste("Item",6:10))
	




