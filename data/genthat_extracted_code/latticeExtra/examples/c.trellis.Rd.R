library(latticeExtra)


### Name: c.trellis
### Title: Merge trellis objects, using same or different scales
### Aliases: c.trellis xyplot.list mergedTrellisLegendGrob
### Keywords: aplot

### ** Examples


## Combine different types of plots.
c(wireframe(volcano), contourplot(volcano))

## Merging levelplot with xyplot
levObj <- levelplot(prop.table(WorldPhones, 1) * 100)
xyObj <- xyplot(Phones ~ Year, data.frame(Phones = rowSums(WorldPhones),
      Year = row.names(WorldPhones)), type="b", ylim = c(0, 150000))
## NOTE: prepanel.levelplot (from first object) is used for entire plot.
cObj <- c(levObj, xyObj, layout = 1:2)
update(cObj, scales = list(y = list(rot = 0)),
       ylab = c("proportional distribution", "number of phones"))

## Combine two xyplots.
sepals <- xyplot(Sepal.Length ~ Sepal.Width, iris, groups = Species,
    xlab = "Width", ylab = "Height")
petals <- xyplot(Petal.Length ~ Petal.Width, iris, groups = Species)
c(Sepals = sepals, Petals = petals)

## Force same scales (re-calculate panel limits from merged data):
c(Sepals = sepals, Petals = petals, x.same = TRUE, y.same = TRUE)

## Or - create xyplots from a list of formulas
xyplot.list(list(Sepals = Sepal.Length ~ Sepal.Width,
                 Petals = Petal.Length ~ Petal.Width),
             data = iris, groups = Species, x.same = TRUE,
             xlab = "Width", ylab = "Height")

## Create histograms from a list of objects, and merge them.
xyplot.list(iris, FUN = histogram)

## Create cumulative distribution plots from a list of objects
xyplot.list(iris[1:4], FUN = qqmath, groups = iris$Species,
            auto.key = TRUE)

## Display a table as both frequencies and proportions:
data(postdoc)
## remove last row (containing totals)
postdoc <- postdoc[1:(nrow(postdoc)-1),]
pdprops <- barchart(prop.table(postdoc, margin = 1),
                    auto.key = list(adj = 1))
pdmargin <- barchart(margin.table(postdoc, 1))
pdboth <- c(pdprops, pdmargin)
update(pdboth, xlab = c("Proportion", "Freq"))

## Conditioned 'quakes' plot combined with histogram.
qua <- xyplot(lat ~ long | equal.count(depth, 3), quakes,
    aspect = "iso", pch = ".", cex = 2, xlab = NULL, ylab = NULL)
qua <- c(qua, depth = histogram(quakes$depth), layout = c(4, 1))
## suppress scales on the first 3 panels
update(qua, scales = list(at = list(NULL, NULL, NULL, NA),
                          y = list(draw = FALSE)))

## Demonstrate merging of legends and par.settings.
## Note that par.settings can conflict, thus need col.line=...
mypoints <- 
    xyplot(1:10 ~ 1:10, groups = factor(rep(1:2, each = 5)),
        par.settings = simpleTheme(pch = 16), auto.key = TRUE)
mylines <-
    xyplot(1:10 ~ 1:10, groups = factor(rep(1:5, each = 2)),
        type = "l", par.settings = simpleTheme(col.line = 1:5),
        auto.key = list(lines = TRUE, points = FALSE, columns = 5))
c(mypoints, mylines)

## Visualise statistical and spatial distributions
## (advanced!)
library(maps)
vars <- as.data.frame(state.x77)
StateName <- tolower(state.name)
form <- StateName ~ Population + Income + Illiteracy +
   `Life Exp` + Murder + `HS Grad` + Frost + sqrt(Area)
## construct independent maps of each variable
statemap <- map("state", plot = FALSE, fill = TRUE)
colkey <- draw.colorkey(list(col = heat.colors(100), at = 0:100,
    labels = list(labels = c("min","max"), at = c(0,100))))
panel.mapplot.each <- function(x, breaks, ...)
    panel.mapplot(x = x, breaks = quantile(x), ...)
vmaps <- mapplot(form, vars, map = statemap, colramp = heat.colors,
    panel = panel.mapplot.each, colorkey = FALSE,
    legend = list(right = list(fun = colkey)), xlab = NULL)
## construct independent densityplots of each variable
vdens <- densityplot(form[-2], vars, outer = TRUE, cut = 0, 
    scales = list(relation = "free"), ylim = c(0, NA),
    cex = 0.5, ref = TRUE) +
  layer(panel.axis("top", half = FALSE, text.cex = 0.7))
## combine panels from both plots
combo <- c(vmaps, vdens)
## rearrange in pairs
n <- length(vars)
npairs <- rep(1:n, each = 2) + c(0, n)
update(combo[npairs], scales = list(draw = FALSE),
    layout = c(4, 4), between = list(x = c(0, 0.5), y = 0.5))



