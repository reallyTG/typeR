library(kohonen)


### Name: nir
### Title: Near-infrared data with temperature effects
### Aliases: nir
### Keywords: datasets

### ** Examples

  data(nir)

  set.seed(3)
  nirnet <- xyf(X = nir$spectra[nir$training,],
                Y = nir$composition[nir$training,],
                user.weights = c(3,1),
                grid = somgrid(6, 6, "hexagonal"), rlen=500)
  plot(nirnet, "counts", main="Counts")

  ## Focus on compound 2 (water):
  par(mfrow = c(1,2))
  set.seed(13)
  nirnet <- xyf(X = nir$spectra[nir$training,],
                Y = nir$composition[nir$training, 2, drop = FALSE],
                grid = somgrid(6, 6, "hexagonal"), rlen=500)
  water.xyf <-
    predict(nirnet, newdata = nir$spectra[nir$training,],
            unit.predictions = getCodes(nirnet, 2),
            whatmap = 1)$prediction
  plot(nirnet, "property", property = water.xyf[[1]],
       main="Prediction of water content")
  ## Plot temperatures as circles
  symbols(nirnet$grid$pts[nirnet$unit.classif,] +
          matrix(rnorm(sum(nir$training)*2, sd=.1), ncol=2),
	  circles = (nir$temperature[nir$training] - 20)/250,
	  inches = FALSE, add = TRUE)

  ## Model temperatures
  set.seed(13)
  nirnet2 <- xyf(X = nir$spectra[nir$training,],
                 Y = matrix(nir$temperature[nir$training], ncol = 1),
                 user.weights = c(1,3),
                 grid = somgrid(6, 6, "hexagonal"), rlen=500)
  temp.xyf <- predict(nirnet2, newdata = nir$spectra[nir$training,],
                      unit.predictions = getCodes(nirnet2, 2),
                      whatmap = 1)$prediction

  plot(nirnet2, "property", property = temp.xyf[[1]],
       palette.name = rainbow,
       main="Prediction of temperatures")
  ## Plot concentrations of water as circles
  symbols(nirnet2$grid$pts[nirnet2$unit.classif,] +
          matrix(rnorm(sum(nir$training)*2, sd=.1), ncol=2),
	  circles = 0.05 + 0.4 * nir$composition[nir$training,2],
	  inches = FALSE, add = TRUE)



