testfs = list(
  sphere.1d = makeSphereFunction(dimensions = 1L),
  sphere.2d = convertToMaximization(makeSphereFunction(dimensions = 2L)),
  zdt1.2d = makeZDT1Function(dimensions = 2L)
)

testfs_nosmoof = list(
  sphere.1d = list(fun = function(x) x^2, upper = 5, lower = -5, minimize = TRUE),
  sphere.2d = list(fun = function(x) -1 * sum(x)^2, upper = 5, lower = -5, minimize = FALSE),
  multi = list(fun = function(x) c(x^2, -1 * x^2), upper = 5, lower = -5, minimize = c(TRUE, FALSE))
)

testds = list(
  sphere.1d = generateRandomDesign(5L, getParamSet(testfs$sphere.1d)),
  sphere.2d = generateRandomDesign(10L, getParamSet(testfs$sphere.2d)),
  zdt1.2d = generateRandomDesign(10L, getParamSet(testfs$zdt1.2d))
)

testdsy = list(
  sphere.1d = cbind(testds$sphere.1d, y = seq_len(nrow(testds$sphere.1d))),
  sphere.2d = cbind(testds$sphere.2d, y = seq_len(nrow(testds$sphere.2d))),
  zdt1.2d = cbind(
    testds$zdt1.2d, 
    y_1 = seq_len(nrow(testds$zdt1.2d)), 
    y_2 = seq_len(nrow(testds$zdt1.2d))
  )
)
