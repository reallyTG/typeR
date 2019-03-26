library(WrightMap)


### Name: WrightMap
### Title: Wright Map: IRT Item-Person Map
### Aliases: WrightMap-package WrightMap
### Keywords: Wright Map IRT Item Response Models Rasch Model

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
		l1 = items.loc - 0.5,
		l2 = items.loc - 0.25,
		l3 = items.loc + 0.25,
		l4 = items.loc + 0.5)

dev.new(width=10, height=10)
wrightMap( uni.proficiency, thresholds)

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

dev.new(width=10, height=10)
wrightMap( uni.proficiency, thresholds
	, thr.lab.text = thresholds.labels
	, thr.lab.col = thresholds.colors
	, thr.sym.pch = thresholds.symbols
	)




