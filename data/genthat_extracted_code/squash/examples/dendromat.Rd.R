library(squash)


### Name: dendromat
### Title: Plot a dendrogram with a colorgram underneath
### Aliases: dendromat
### Keywords: hplot

### ** Examples
 

## Motor Trend car road test data
mt.dend <- hclust(dist(mtcars[,1:7]))
mt.mat <- mtcars[,8:11]

## A minimal dendromat
dendromat(mt.dend, mt.mat)

## The same plot, but with a few enhancements
names(mt.mat) <- c('Straight', 'Manual', '# gears', '# carbs')
dendromat(mt.dend, mt.mat, gap = 0.5, border = 'gray', las = 2, 
  ylab = 'Euclidean distance', 
  main = 'mtcars, clustered by performance')
legend('topright', legend = 0:8, fill = 0:8)

## US state data, with color keys
us.dend <- hclust(dist(scale(state.x77)))

income <- state.x77[, 'Income']
frost <- state.x77[, 'Frost']
murder <- state.x77[, 'Murder']

income.cmap <- makecmap(income, n = 5, colFn = colorRampPalette(c('black', 'green')))
frost.cmap <- makecmap(frost, n = 5, colFn = colorRampPalette(c('black', 'blue')))
murder.cmap <- makecmap(murder, n = 5, colFn = colorRampPalette(c('black', 'red')))

us.mat <- data.frame(Frost = cmap(frost, frost.cmap),
                     Murder = cmap(murder, murder.cmap),
                     Income = cmap(income, income.cmap))

par(mar = c(5,4,4,3)+0.1)
dendromat(us.dend, us.mat,
  ylab = 'Distance', main = 'US states')

vkey(frost.cmap, 'Frost')
vkey(murder.cmap, 'Murder', y = 0.3)
vkey(income.cmap, 'Income', y = 0.7)




