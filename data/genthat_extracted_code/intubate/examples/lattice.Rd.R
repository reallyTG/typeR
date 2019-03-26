library(intubate)


### Name: lattice
### Title: Interfaces for lattice package for data science pipelines.
### Aliases: ntbt_barchart ntbt_bwplot ntbt_cloud ntbt_contourplot
###   ntbt_densityplot ntbt_dotplot ntbt_histogram ntbt_levelplot
###   ntbt_oneway ntbt_parallelplot ntbt_qq ntbt_qqmath ntbt_splom
###   ntbt_stripplot ntbt_tmd ntbt_wireframe ntbt_xyplot
### Keywords: intubate magrittr lattice barchart bwplot cloud contourplot
###   densityplot dotplot histogram levelplot oneway parallelplot qq qqmath
###   splom stripplot tmd wireframe xyplot

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(lattice)
##D 
##D ## barchart
##D ## Original function to interface
##D barchart(yield ~ variety | site, data = barley,
##D          groups = year, layout = c(1,6), stack = TRUE,
##D          auto.key = list(space = "right"),
##D          ylab = "Barley Yield (bushels/acre)",
##D          scales = list(x = list(rot = 45)))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_barchart(data = barley, yield ~ variety | site,
##D               groups = year, layout = c(1,6), stack = TRUE,
##D               auto.key = list(space = "right"),
##D               ylab = "Barley Yield (bushels/acre)",
##D               scales = list(x = list(rot = 45)))
##D 
##D ## so it can be used easily in a pipeline.
##D barley %>%
##D   ntbt_barchart(yield ~ variety | site,
##D                 groups = year, layout = c(1,6), stack = TRUE,
##D                 auto.key = list(space = "right"),
##D                 ylab = "Barley Yield (bushels/acre)",
##D                 scales = list(x = list(rot = 45)))
##D 
##D ## bwplot
##D ## Original function to interface
##D bwplot(voice.part ~ height, data = singer, xlab = "Height (inches)")
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_bwplot(data = singer, voice.part ~ height, xlab = "Height (inches)")
##D 
##D ## so it can be used easily in a pipeline.
##D singer %>%
##D   ntbt_bwplot(voice.part ~ height, xlab = "Height (inches)")
##D 
##D ## cloud
##D ## Original function to interface
##D cloud(Sepal.Length ~ Petal.Length * Petal.Width | Species, data = iris,
##D       screen = list(x = -90, y = 70), distance = .4, zoom = .6)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_cloud(data = iris, Sepal.Length ~ Petal.Length * Petal.Width | Species,
##D            screen = list(x = -90, y = 70), distance = .4, zoom = .6)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_cloud(Sepal.Length ~ Petal.Length * Petal.Width | Species,
##D              screen = list(x = -90, y = 70), distance = .4, zoom = .6)
##D 
##D ## contourplot
##D grid <- with(
##D   environmental,
##D   {
##D     ozo.m <- loess((ozone^(1/3)) ~ wind * temperature * radiation,
##D                    parametric = c("radiation", "wind"), span = 1, degree = 2)
##D     w.marginal <- seq(min(wind), max(wind), length.out = 50)
##D     t.marginal <- seq(min(temperature), max(temperature), length.out = 50)
##D     r.marginal <- seq(min(radiation), max(radiation), length.out = 4)
##D     wtr.marginal <- list(wind = w.marginal, temperature = t.marginal,
##D                          radiation = r.marginal)
##D     ret <- expand.grid(wtr.marginal)
##D     ret[, "fit"] <- c(predict(ozo.m, ret))
##D     ret
##D   })
##D 
##D ## Original function to interface
##D contourplot(fit ~ wind * temperature | radiation, data = grid,
##D             cuts = 10, region = TRUE,
##D             xlab = "Wind Speed (mph)",
##D             ylab = "Temperature (F)",
##D             main = "Cube Root Ozone (cube root ppb)")
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_contourplot(data = grid, fit ~ wind * temperature | radiation,
##D                  cuts = 10, region = TRUE,
##D                  xlab = "Wind Speed (mph)",
##D                  ylab = "Temperature (F)",
##D                  main = "Cube Root Ozone (cube root ppb)")
##D 
##D ## so it can be used easily in a pipeline.
##D grid %>%
##D   ntbt_contourplot(fit ~ wind * temperature | radiation,
##D                    cuts = 10, region = TRUE,
##D                    xlab = "Wind Speed (mph)",
##D                    ylab = "Temperature (F)",
##D                    main = "Cube Root Ozone (cube root ppb)")
##D 
##D ## densityplot
##D ## Original function to interface
##D densityplot(~ height | voice.part, data = singer, layout = c(2, 4),  
##D             xlab = "Height (inches)", bw = 5)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_densityplot(data = singer, ~ height | voice.part, layout = c(2, 4),  
##D                  xlab = "Height (inches)", bw = 5)
##D 
##D ## so it can be used easily in a pipeline.
##D singer %>%
##D   ntbt_densityplot(~ height | voice.part, layout = c(2, 4),  
##D                    xlab = "Height (inches)", bw = 5)
##D 
##D ## dotplot
##D ## Original function to interface
##D dotplot(variety ~ yield | site, data = barley, groups = year,
##D         key = simpleKey(levels(barley$year), space = "right"),
##D         xlab = "Barley Yield (bushels/acre) ",
##D         aspect=0.5, layout = c(1,6), ylab=NULL)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_dotplot(data = barley, variety ~ yield | site, groups = year,
##D              key = simpleKey(levels(barley$year), space = "right"),
##D              xlab = "Barley Yield (bushels/acre) ",
##D              aspect=0.5, layout = c(1,6), ylab=NULL)
##D 
##D ## so it can be used easily in a pipeline.
##D barley %>%
##D   ntbt_dotplot(variety ~ yield | site, groups = year,
##D              key = simpleKey(levels(barley$year), space = "right"),
##D              xlab = "Barley Yield (bushels/acre) ",
##D              aspect=0.5, layout = c(1,6), ylab=NULL)
##D 
##D ## histogram
##D ## Original function to interface
##D histogram(~ height | voice.part, data = singer,
##D           xlab = "Height (inches)", type = "density",
##D           panel = function(x, ...) {
##D             panel.histogram(x, ...)
##D             panel.mathdensity(dmath = dnorm, col = "black",
##D                               args = list(mean=mean(x),sd=sd(x)))
##D           })
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_histogram(data = singer, ~ height | voice.part,
##D                xlab = "Height (inches)", type = "density",
##D                panel = function(x, ...) {
##D                  panel.histogram(x, ...)
##D                  panel.mathdensity(dmath = dnorm, col = "black",
##D                                    args = list(mean=mean(x),sd=sd(x)))
##D                })
##D 
##D ## so it can be used easily in a pipeline.
##D singer %>%
##D   ntbt_histogram(~ height | voice.part,
##D                  xlab = "Height (inches)", type = "density",
##D                  panel = function(x, ...) {
##D                    panel.histogram(x, ...)
##D                    panel.mathdensity(dmath = dnorm, col = "black",
##D                                      args = list(mean=mean(x),sd=sd(x)))
##D                  })
##D 
##D ## levelplot
##D x <- seq(pi/4, 5 * pi, length.out = 100)
##D y <- seq(pi/4, 5 * pi, length.out = 100)
##D r <- as.vector(sqrt(outer(x^2, y^2, "+")))
##D grid <- expand.grid(x = x, y = y)
##D grid$z <- cos(r^2) * exp(-r/(pi^3))
##D 
##D ## Original function to interface
##D levelplot(z ~ x*y, grid, cuts = 50, scales = list(log = "e"), xlab = "",
##D           ylab = "", main = "Weird Function", sub = "with log scales",
##D           colorkey = FALSE, region = TRUE)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_levelplot(grid, z ~ x*y, cuts = 50, scales = list(log = "e"), xlab = "",
##D                ylab = "", main = "Weird Function", sub = "with log scales",
##D                colorkey = FALSE, region = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D grid %>%
##D   ntbt_levelplot(z ~ x*y, cuts = 50, scales = list(log = "e"), xlab = "",
##D                  ylab = "", main = "Weird Function", sub = "with log scales",
##D                  colorkey = FALSE, region = TRUE)
##D 
##D ## oneway
##D ## Original function to interface
##D fit <- oneway(height ~ voice.part, data = singer, spread = 1)
##D rfs(fit, aspect = 1)
##D 
##D ## The interface reverses the order of data and formula
##D fit <- ntbt_oneway(data = singer, height ~ voice.part, spread = 1)
##D rfs(fit, aspect = 1)
##D 
##D ## so it can be used easily in a pipeline.
##D singer %>%
##D   ntbt_oneway(height ~ voice.part, spread = 1) %>%
##D   rfs(aspect = 1)
##D 
##D ## parallelplot
##D ## Original function to interface
##D parallelplot(~iris[1:4], iris, groups = Species,
##D              horizontal.axis = FALSE, scales = list(x = list(rot = 90)))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_parallelplot(iris, ~iris[1:4], groups = Species,
##D                   horizontal.axis = FALSE, scales = list(x = list(rot = 90)))
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_parallelplot(~iris[1:4], groups = Species,
##D                     horizontal.axis = FALSE, scales = list(x = list(rot = 90)))
##D 
##D ## qq
##D ## Original function to interface
##D qq(voice.part ~ height, data = singer, aspect = 1,
##D    subset = (voice.part == "Bass 2" | voice.part == "Tenor 1"))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_qq(data = singer, voice.part ~ height, aspect = 1,
##D         subset = (voice.part == "Bass 2" | voice.part == "Tenor 1"))
##D 
##D ## so it can be used easily in a pipeline.
##D singer %>%
##D   ntbt_qq(voice.part ~ height, aspect = 1,
##D           subset = (voice.part == "Bass 2" | voice.part == "Tenor 1"))
##D 
##D ## qqmath
##D ## Original function to interface
##D qqmath(~ height | voice.part, data = singer, aspect = "xy",
##D        prepanel = prepanel.qqmathline,
##D        panel = function(x, ...) {
##D          panel.qqmathline(x, ...)
##D          panel.qqmath(x, ...)
##D        })
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_qqmath(data = singer, ~ height | voice.part, aspect = "xy",
##D             prepanel = prepanel.qqmathline,
##D             panel = function(x, ...) {
##D               panel.qqmathline(x, ...)
##D               panel.qqmath(x, ...)
##D             })
##D 
##D ## so it can be used easily in a pipeline.
##D singer %>%
##D   ntbt_qqmath(~ height | voice.part, aspect = "xy",
##D               prepanel = prepanel.qqmathline,
##D               panel = function(x, ...) {
##D                 panel.qqmathline(x, ...)
##D                 panel.qqmath(x, ...)
##D               })
##D 
##D ## splom
##D super.sym <- trellis.par.get("superpose.symbol")
##D 
##D ## Original function to interface
##D splom(~ iris[1:4], data = iris, groups = Species,
##D       panel = panel.superpose,
##D       key = list(title = "Three Varieties of Iris",
##D                  columns = 3, 
##D                  points = list(pch = super.sym$pch[1:3],
##D                                col = super.sym$col[1:3]),
##D                  text = list(c("Setosa", "Versicolor", "Virginica"))))
##D splom(~ iris[1:3] | Species, data = iris, 
##D       layout=c(2,2), pscales = 0,
##D       varnames = c("Sepal\nLength", "Sepal\nWidth", "Petal\nLength"),
##D       page = function(...) {
##D         ltext(x = seq(.6, .8, length.out = 4), 
##D               y = seq(.9, .6, length.out = 4), 
##D               labels = c("Three", "Varieties", "of", "Iris"),
##D               cex = 2)
##D       })
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_splom(data = iris, ~ iris[1:4], groups = Species,
##D            panel = panel.superpose,
##D            key = list(title = "Three Varieties of Iris",
##D                       columns = 3, 
##D                       points = list(pch = super.sym$pch[1:3],
##D                                     col = super.sym$col[1:3]),
##D                       text = list(c("Setosa", "Versicolor", "Virginica"))))
##D ntbt_splom(data = iris, ~ iris[1:3] | Species,
##D            layout=c(2,2), pscales = 0,
##D            varnames = c("Sepal\nLength", "Sepal\nWidth", "Petal\nLength"),
##D            page = function(...) {
##D              ltext(x = seq(.6, .8, length.out = 4), 
##D                    y = seq(.9, .6, length.out = 4), 
##D                    labels = c("Three", "Varieties", "of", "Iris"),
##D                    cex = 2)
##D            })
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_splom(~ iris[1:4], groups = Species,
##D              panel = panel.superpose,
##D              key = list(title = "Three Varieties of Iris",
##D                         columns = 3, 
##D                         points = list(pch = super.sym$pch[1:3],
##D                                       col = super.sym$col[1:3]),
##D                         text = list(c("Setosa", "Versicolor", "Virginica"))))
##D iris %>%
##D   ntbt_splom(~ iris[1:3] | Species,
##D              layout=c(2,2), pscales = 0,
##D              varnames = c("Sepal\nLength", "Sepal\nWidth", "Petal\nLength"),
##D              page = function(...) {
##D                ltext(x = seq(.6, .8, length.out = 4), 
##D                      y = seq(.9, .6, length.out = 4), 
##D                      labels = c("Three", "Varieties", "of", "Iris"),
##D                      cex = 2)
##D              })
##D 
##D ## stripplot
##D ## Original function to interface
##D stripplot(voice.part ~ jitter(height), data = singer, aspect = 1,
##D           jitter.data = TRUE, xlab = "Height (inches)")
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_stripplot(data = singer, voice.part ~ jitter(height), aspect = 1,
##D           jitter.data = TRUE, xlab = "Height (inches)")
##D 
##D ## so it can be used easily in a pipeline.
##D singer %>%
##D   ntbt_stripplot(voice.part ~ jitter(height), aspect = 1,
##D                  jitter.data = TRUE, xlab = "Height (inches)")
##D 
##D ## tmd
##D ## Original function to interface
##D tmd(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D     data = iris, scales = "free", layout = c(2, 2),
##D     auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_tmd(data = iris, 
##D          Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D          scales = "free", layout = c(2, 2),
##D          auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_tmd(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D            scales = "free", layout = c(2, 2),
##D            auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
##D 
##D ## wireframe
##D g <- expand.grid(x = 1:10, y = 5:15, gr = 1:2)
##D g$z <- log((g$x^g$gr + g$y^2) * g$gr)
##D 
##D ## Original function to interface
##D wireframe(z ~ x * y, data = g, groups = gr,
##D           scales = list(arrows = FALSE),
##D           drape = TRUE, colorkey = TRUE,
##D           screen = list(z = 30, x = -60))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_wireframe(data = g, z ~ x * y, groups = gr,
##D                scales = list(arrows = FALSE),
##D                drape = TRUE, colorkey = TRUE,
##D                screen = list(z = 30, x = -60))
##D 
##D ## so it can be used easily in a pipeline.
##D g %>%
##D   ntbt_wireframe(z ~ x * y, groups = gr,
##D                  scales = list(arrows = FALSE),
##D                  drape = TRUE, colorkey = TRUE,
##D                  screen = list(z = 30, x = -60))
##D 
##D ## xyplot
##D ## Original function to interface
##D xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D        data = iris, scales = "free", layout = c(2, 2),
##D        auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_xyplot(data = iris, 
##D             Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D             scales = "free", layout = c(2, 2),
##D             auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
##D               scales = "free", layout = c(2, 2),
##D               auto.key = list(x = .6, y = .7, corner = c(0, 0)))
##D 
## End(Not run)



