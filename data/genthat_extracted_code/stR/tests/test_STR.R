test_that("Test 1", {

seasonalStructure = list(segments = list(c(1,4)), sKnots = list(c(1, 4), 2, 3))
toTest = as.matrix(seasonalTransformer(nKnots = 3, seasonalStructure = seasonalStructure))

v1 = c(1,    0,    0,    0,    0,    0)
v2 = c(0,    1,    0,    0,    0,    0)
v3 = c(-1,   -1,  0,     0,    0,    0)
v4 = c(0,    0,    1,    0,    0,    0)
v5 = c(0,    0,    0,    1,    0,    0)
v6 = c(0,    0,   -1,   -1,    0,    0)
v7 = c(0,    0,    0,    0,    1,    0)
v8 = c(0,    0,    0,    0,    0,    1)
v9 = c(0,    0,    0,    0,   -1,   -1)

toCompare = rbind(v1, v2, v3, v4, v5, v6, v7, v8, v9)

expect_false(!identical(dim(toTest), dim(toCompare)) || sum(toTest != toCompare)>0)

seasonalStructure = list(segments = list(c(1,6)), sKnots = list(c(1, 6), 2, 3))
toTest = as.matrix(seasonalTransformer(nKnots = 3, seasonalStructure = seasonalStructure))

v1 = c(1,    0,    0,    0,    0,    0)
v2 = c(0,    1,    0,    0,    0,    0)
v3 = c(-1,   -0.5,  0,     0,    0,    0)
v4 = c(0,    0,    1,    0,    0,    0)
v5 = c(0,    0,    0,    1,    0,    0)
v6 = c(0,    0,   -1,   -0.5,    0,    0)
v7 = c(0,    0,    0,    0,    1,    0)
v8 = c(0,    0,    0,    0,    0,    1)
v9 = c(0,    0,    0,    0,   -1,   -0.5)

toCompare = rbind(v1, v2, v3, v4, v5, v6, v7, v8, v9)

expect_false(!identical(dim(toTest), dim(toCompare)) || sum(toTest != toCompare)>0)

seasonalStructure = list(segments = list(c(0,5)), sKnots = list(3, 4, c(0, 5)))
toTest = as.matrix (seasonalTransformer(nKnots = 3, seasonalStructure = seasonalStructure))

v1 = c(1,    0,    0,    0,    0,    0)
v2 = c(0,    1,    0,    0,    0,    0)
v3 = c(-1,   -0.5,  0,     0,    0,    0)
v4 = c(0,    0,    1,    0,    0,    0)
v5 = c(0,    0,    0,    1,    0,    0)
v6 = c(0,    0,   -1,   -0.5,    0,    0)
v7 = c(0,    0,    0,    0,    1,    0)
v8 = c(0,    0,    0,    0,    0,    1)
v9 = c(0,    0,    0,    0,   -1,   -0.5)

toCompare = rbind(v1, v2, v3, v4, v5, v6, v7, v8, v9)

expect_false(!identical(dim(toTest), dim(toCompare)) || sum(toTest != toCompare)>0)

seasonalStructure = list(segments = list(c(0,5)), sKnots = list(1, 4, c(0, 5)))
toTest = as.matrix (seasonalTransformer(nKnots = 3, seasonalStructure = seasonalStructure))

v1 = c(1,    0,    0,    0,    0,    0)
v2 = c(0,    1,    0,    0,    0,    0)
v3 = c(-2,   -2,  0,     0,    0,    0)
v4 = c(0,    0,    1,    0,    0,    0)
v5 = c(0,    0,    0,    1,    0,    0)
v6 = c(0,    0,   -2,   -2,    0,    0)
v7 = c(0,    0,    0,    0,    1,    0)
v8 = c(0,    0,    0,    0,    0,    1)
v9 = c(0,    0,    0,    0,   -2,   -2)

toCompare = rbind(v1, v2, v3, v4, v5, v6, v7, v8, v9)

expect_false(!identical(dim(toTest), dim(toCompare)) || sum(toTest != toCompare)>0)

seasonalStructure = list(segments = list(c(0,5)), sKnots = list(2, 4, c(0, 5)))
toTest = as.matrix (seasonalTransformer(nKnots = 3, seasonalStructure = seasonalStructure))

v1 = c(1,    0,    0,    0,    0,    0)
v2 = c(0,    1,    0,    0,    0,    0)
v3 = c(-4/3,   -1,  0,     0,    0,    0)
v4 = c(0,    0,    1,    0,    0,    0)
v5 = c(0,    0,    0,    1,    0,    0)
v6 = c(0,    0,   -4/3,   -1,    0,    0)
v7 = c(0,    0,    0,    0,    1,    0)
v8 = c(0,    0,    0,    0,    0,    1)
v9 = c(0,    0,    0,    0,   -4/3,   -1)

toCompare = rbind(v1, v2, v3, v4, v5, v6, v7, v8, v9)

expect_false(!identical(dim(toTest), dim(toCompare)) || sum(toTest != toCompare)>0)

})


test_that("Test 2", {

toTest = as.matrix(seasonalTransposer(nKnots = 3, nSKnots = 3))
m = matrix(1:9, 3, 3)

v1 = as.vector(toTest %*% as.vector(m))
v2 = as.vector(t(m))
expect_false(!identical(length(v1), length(v2)) || sum(v1 != v2)>0)

for(nk in 1:10) {
  for(nsk in 2:10) {
    toTest = as.matrix(seasonalTransposer(nk, nsk))
    m = matrix(1:(nk*nsk), nsk, nk)

    v1 = as.vector(toTest %*% as.vector(m))
    v2 = as.vector(t(m))
    expect_false(!identical(length(v1), length(v2)) || sum(v1 != v2)>0)
  }
}

})


test_that("Test 3", {

times = c(1,2,5,9,9.5,10)
data = rep(1, length(times))
seasons = rep(0, length(times))
timeKnots = c(1,3,10)

seasonalStructure = list(segments = list(c(0,1)), sKnots = list(c(0,1)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)

matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))

vk = c(1,3,10)
toTest = as.vector(matrixToTest %*% vk)

expect_true(sum(abs(toTest - times) > 1E-6) == 0)
expect_true(length(toTest) == length(times))

# Now let's test with 2 time knots

timeKnots = c(1,10)
seasonalStructure = list(segments = list(c(0,1)), sKnots = list(c(0,1)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)

matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))

vk = c(1,10)
toTest = as.vector(matrixToTest %*% vk)

expect_true(length(toTest) == length(times))
expect_true(sum(abs(toTest - times) > 1E-6) == 0)

# Testing with no time knots (static predictor)

times = c(1,2,5,9,9.5,10)
data = times
seasons = NULL
timeKnots = NULL

seasonalStructure = NULL
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)

matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))

vk = c(1)
toTest = as.vector(matrixToTest %*% vk)

expect_true(length(toTest) == length(times))
expect_true(sum(abs(toTest - times) > 1E-6) == 0)

# Testing static predictor

times = c(1,2,5,9,9.5,10)
data = times
data_ = data + c(0.1,-0.2,0.3,0.1,-0.3,0)
seasons = NULL
timeKnots = NULL

seasonalStructure = NULL
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure, lambdas = c(0,0,0))

str = STRmodel(data = data_, predictors = list(predictor))
# plot(str)

#############################################

timeKnots = c(1,5,9)
times = 1:9
seasons = c(2,3,1,2,3,1,2,3,1)
data = rep(1, length(times))
seasonalStructure = list(segments = list(c(0,3)), sKnots = list(1,2,c(3,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = c(-1,0,-1,0,-1,0)
toCompare = c(0,1,-1,0,1,-1,0,1,-1)
toTest = matrixToTest %*% v
expect_false(!(sum(abs(toTest - toCompare) > 1E-6) == 0 && length(toTest) == length(toCompare)))

timeKnots = c(1,5,9)
times = 1:6
seasons = c(2,1,2,1,2,1)
data = rep(1, length(times))
seasonalStructure = list(segments = list(c(0,2)), sKnots = list(1,c(2,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = c(-1,-1,-1)
toCompare = c(1,-1,1,-1,1,-1)
toTest = matrixToTest %*% v
expect_false(!(sum(abs(toTest - toCompare) > 1E-6) == 0 && length(toTest) == length(toCompare)))

timeKnots = c(1,5,9,15)
seasons = c(2,3,4,5,1,2,3,4,5,1,2,3,4,5,1)
times = seq_along(seasons)
data = rep(1, length(times))
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(1,2,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = c(-2,-1,0,1,-2,-1,0,1,-2,-1,0,1,-2,-1,0,1)
toCompare = c(-1,0,1,2,-2,-1,0,1,2,-2,-1,0,1,2,-2)
toTest = matrixToTest %*% v
expect_false(!(sum(abs(toTest - toCompare) > 1E-6) == 0 && length(toTest) == length(toCompare)))

timeKnots = c(1,8,15)
seasons = c(2,3,4,5,1,2,3,4,5,1,2,3,4,5,1)
times = seq_along(seasons)
data = rep(1, length(times))
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(1,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = c(-2,0,1,-2,0,1,-2,0,1)
toCompare = c(-1,0,1,2,-2,-1,0,1,2,-2,-1,0,1,2,-2)
toTest = matrixToTest %*% v
expect_false(!(sum(abs(toTest - toCompare) > 1E-6) == 0 && length(toTest) == length(toCompare)))

timeKnots = c(1,8,15)
seasons = c(2,3,4,5,1,2,3,4,5,1,2,3,4,5,1)
times = seq_along(seasons)
data = rep(1, length(times))
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(2,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = c(-2,-1,1,-2,-1,1,-2,-1,1)
toCompare = c(-2,-1,1,2,0,-2,-1,1,2,0,-2,-1,1,2,0)
toTest = matrixToTest %*% v
expect_false(!(sum(abs(toTest - toCompare) > 1E-6) == 0 && length(toTest) == length(toCompare)))

timeKnots = c(1,8,15)
seasons = c(2,3,4,5,1,2,3,4,5,1,2,3,4,5,1)
times = seq_along(seasons)
data = rep(1, length(times))
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(2,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = c(-2,-1,1,0,0,0,-2,-1,1)
toCompare = c(-2,-1*(6/7),1*(5/7),2*(4/7),0*(3/7),-2*(2/7),-1*(1/7), 1*0 ,2*(1/7),0*(2/7),-2*(3/7),-1*(4/7),1*(5/7),2*(6/7),0)
toTest = matrixToTest %*% v
expect_false(!(sum(abs(toTest - toCompare) > 1E-6) == 0 && length(toTest) == length(toCompare)))

})


test_that("Test 4", {

data = c(7,3,1,5,3)
timeKnots = c(1,2,3,5)
seasons = rep(0, length(data))
times = seq_along(seasons)
seasonalStructure = list(segments = list(c(0,1)), sKnots = list(c(0,1)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = rep(1, length(timeKnots))
expect_true(all(abs(matrixToTest %*% v - data) < 1E-6))

data = c(7,3,1,5,3)
timeKnots = c(1,4,5)
seasons = rep(0, length(data))
times = seq_along(seasons)
seasonalStructure = list(segments = list(c(0,1)), sKnots = list(c(0,1)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = rep(1, length(timeKnots))
expect_true(all(abs(matrixToTest %*% v - data) < 1E-6))

#############################################

timeKnots = c(1,5,9)
times = 1:9
seasons = c(2,3,1,2,3,1,2,3,1)
data = (1:length(times))^2-7
seasonalStructure = list(segments = list(c(0,3)), sKnots = list(1,2,c(3,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = c(-1,0,-1,0,-1,0)
toCompare = c(0,1,-1,0,1,-1,0,1,-1) * data
toTest = matrixToTest %*% v
expect_false(!(sum(abs(toTest - toCompare) > 1E-6) == 0 && length(toTest) == 9))

timeKnots = c(1,8,15)
seasons = c(2,3,4,5,1,2,3,4,5,1,2,3,4,5,1)
times = seq_along(seasons)
data = (1:length(times))^2-7
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(2,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(seasonalPredictorConstructor(predictor))
v = c(-2,-1,1,0,0,0,-2,-1,1)
toCompare = c(-2,-1*(6/7),1*(5/7),2*(4/7),0*(3/7),-2*(2/7),-1*(1/7), 1*0 ,2*(1/7),0*(2/7),-2*(3/7),-1*(4/7),1*(5/7),2*(6/7),0) * data
toTest = matrixToTest %*% v
expect_false(!(sum(abs(toTest - toCompare) > 1E-6) == 0 && length(toTest) == length(toCompare)))

})


test_that("Test 5", {

n = 5
v = 1:n
expect_true(all(abs(as.matrix(diff1(n)) %*% v - rep(1, n-1)) < 1E-6))

n = 25
v = 1:n
expect_true(all(abs(as.matrix(diff2(n)) %*% v - rep(0, n-2)) < 1E-6))

})


test_that("Test 6", {

knots = c(1,3,5,7,9)
vd = as.matrix(vector2Derivatives(knots, weights = rep(1, length(knots)-2)))
expect_true(all(abs(vd %*% knots - rep(0, length(knots)-2)) < 1E-6))

knots = c(1,5,7,9)
vd = as.matrix(vector2Derivatives(knots, weights = rep(1, length(knots)-2)))
expect_true(all(abs(vd %*% knots - rep(0, length(knots)-2)) < 1E-6))

knots = c(1,8.9,9)
vd = as.matrix(vector2Derivatives(knots, weights = rep(1, length(knots)-2)))
expect_true(all(abs(vd %*% knots - rep(0, length(knots)-2)) < 1E-6))

knots = c(1,8.9,9)
vd = as.matrix(vector2Derivatives(knots, weights = rep(1, length(knots)-2)))
expect_true(all(abs(vd %*% (knots^2) - rep(2, length(knots)-2)) < 1E-6))

knots = c(1,8.9,9,12,14,15,16)
vd = as.matrix(vector2Derivatives(knots, weights = rep(1, length(knots)-2)))
expect_true(all(abs(vd %*% (knots^2) - rep(2, length(knots)-2)) < 1E-6))

knots = c(1,8.9,9,12,14,15,16)
vd = as.matrix(vector2Derivatives(knots, weights = rep(0.5, length(knots)-2)))
expect_true(all(abs(vd %*% (knots^2) - rep(1, length(knots)-2)) < 1E-6))

})


test_that("Test 7", {

seasonalStructure = list(segments = list(c(0,24), c(100,124), c(212,224), c(312,324)),
                         sKnots = list(c(0,24,324),4,8,c(12, 212),16,20,c(100,124,224),104,108,c(112,312),116,120,216,220,316,320)
)

lrk = lrKnots(seasonalStructure)
lk = list(c(NA,20,320),0,4,c(8, NA),12,16,c(NA,120,220),100,104,c(108,NA),112,116,212,216,312,316)
rk = list(c(4,NA,NA),8,12,c(16, 216),20,24,c(104,NA,NA),108,112,c(116,316),120,124,220,224,320,324)
expect_true(length(lrk$lKnots) == length(lk))
expect_true(length(lrk$rKnots) == length(rk))
expect_true(sum(!unlist(lapply(seq_along(lrk$lKnots), function(i) identical(lk[[i]], lrk$lKnots[[i]])))) == 0)
expect_true(sum(!unlist(lapply(seq_along(lrk$rKnots), function(i) identical(rk[[i]], lrk$rKnots[[i]])))) == 0)

expect_true(knotToIndex(0, seasonalStructure$sKnots) == 1)
expect_true(knotToIndex(4, seasonalStructure$sKnots) == 2)
expect_true(knotToIndex(8, seasonalStructure$sKnots) == 3)
expect_true(knotToIndex(12, seasonalStructure$sKnots) == 4)
expect_true(knotToIndex(16, seasonalStructure$sKnots) == 5)
expect_true(knotToIndex(20, seasonalStructure$sKnots) == 6)
expect_true(knotToIndex(24, seasonalStructure$sKnots) == 1)
expect_true(knotToIndex(100, seasonalStructure$sKnots) == 7)
expect_true(knotToIndex(104, seasonalStructure$sKnots) == 8)
expect_true(knotToIndex(108, seasonalStructure$sKnots) == 9)
expect_true(knotToIndex(112, seasonalStructure$sKnots) == 10)
expect_true(knotToIndex(116, seasonalStructure$sKnots) == 11)
expect_true(knotToIndex(120, seasonalStructure$sKnots) == 12)
expect_true(knotToIndex(124, seasonalStructure$sKnots) == 7)
expect_true(knotToIndex(212, seasonalStructure$sKnots) == 4)
expect_true(knotToIndex(216, seasonalStructure$sKnots) == 13)
expect_true(knotToIndex(220, seasonalStructure$sKnots) == 14)
expect_true(knotToIndex(224, seasonalStructure$sKnots) == 7)
expect_true(knotToIndex(312, seasonalStructure$sKnots) == 10)
expect_true(knotToIndex(316, seasonalStructure$sKnots) == 15)
expect_true(knotToIndex(320, seasonalStructure$sKnots) == 16)
expect_true(knotToIndex(324, seasonalStructure$sKnots) == 1)

})


test_that("Test 7", {

seasonalStructure = list(segments = list(c(0,24), c(100,124), c(212,224), c(312,324)),
                         sKnots = list(c(0,24,324),4,8,c(12, 212),16,20,c(100,124,224),104,108,c(112,312),116,120,216,220,316,320)
)
tm = as.matrix(cycle2Derivatives(seasonalStructure))
sKnots = seasonalStructure$sKnots
nSKnots = length(sKnots)
v = rep(7.7, nSKnots)
toTest = as.vector(tm %*% v)
expect_true(all(abs(toTest) < 1E-6))

seasonalStructure = list(segments = list(c(0,4), c(10,14)),
                         sKnots = list(c(0,4,10,14),1,2,3,11,12,13)
)
tm = as.matrix(cycle2Derivatives(seasonalStructure))
sKnots = seasonalStructure$sKnots
nSKnots = length(sKnots)
expect_true(nSKnots == 7)
v = rep(7.7, nSKnots)
toTest = as.vector(tm %*% v)
expect_true(all(abs(toTest) < 1E-6))
expect_true(length(toTest) == 10)

v = c(1,1,1,1,1,2,1)
tm = as.matrix(cycle2Derivatives(seasonalStructure, norm = 1))
toTest = as.vector(tm %*% v)
expect_true(all(abs(toTest - c(0,0,0,0,0,0,0,1,-2,1)) < 1E-6))

v = c(1,1,1,1,1,2,1)
tm = as.matrix(cycle2Derivatives(seasonalStructure, norm = 2))
toTest = as.vector(tm %*% v)
expect_true(all(abs(toTest - c(0,0,0,0,0,0,0,1,-2,1)) < 1E-6))

v = c(2,1,1,1,1,1,1)
tm = as.matrix(cycle2Derivatives(seasonalStructure, norm = 1))
toTest = as.vector(tm %*% v)
expect_true(all(abs(toTest - c(-1,-1,-1,-1,1,0,1,1,0,1)) < 1E-6))

v = c(2,1,1,1,1,1,1)
tm = as.matrix(cycle2Derivatives(seasonalStructure, norm = 2))
toTest = as.vector(tm %*% v)
expect_true(all(abs(toTest - c(-sqrt(2),-sqrt(2),-sqrt(2),-sqrt(2),1,0,1,1,0,1)) < 1E-6))

v = c(1,2,1,1,1,1,1)
tm = as.matrix(cycle2Derivatives(seasonalStructure, norm = 1))
toTest = as.vector(tm %*% v)
expect_true(all(abs(toTest - c(0.5,0,0.5,0,-2,1,0,0,0,0)) < 1E-6))

seasonalStructure = list(segments = list(c(0,4)),
                         sKnots = list(1,2,3,c(0,4))
)

c2d = as.matrix(cycle2Derivatives(seasonalStructure, norm = 2))
v = c(0,1,0,1)
expect_true(all(abs(c2d %*% v - 2*c(1,-1,1,-1)) < 1E-6))

})


test_that("Test 8", {

timeKnots = c(1,6,11)
times = 1:11
seasons = c(1,2,3,4,5,1,2,3,4,5)
data = (1:length(times))^2-7
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(1,2,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(ssRegulariser(predictor, norm = 1))

# I do not know how to test it...

})


test_that("Test 9", {

timeKnots = c(1,6,11)
times = 1:11
seasons = c(1,2,3,4,5,1,2,3,4,5)
data = (1:length(times))^2-7
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(1,2,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(ttRegulariser(predictor, norm = 1))

v = c(1,1,1,1,1,1,1,1,1,1,1,1)
toTest = as.vector(matrixToTest %*% v)
expect_true(all(toTest < 1E-6))

v = c(1,1,1,1,2,2,2,2,1,1,1,1)
toTest = as.vector(matrixToTest %*% v)
toCompare = c(-0.4,-0.4,-0.4,-0.4,1.6)
expect_true(all(toTest - toCompare < 1E-6))

})


test_that("Test 10", {

timeKnots = c(1,6,11)
times = 1:11
seasons = c(1,2,3,4,5,1,2,3,4,5)
data = (1:length(times))^2-7
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(1,2,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure)
matrixToTest = as.matrix(stRegulariser(predictor, norm = 1))

v = c(1,1,1,1,1,1,1,1,1,1,1,1)
toTest = as.vector(matrixToTest %*% v)
toCompare = rep(0, 10)
expect_true(all(toTest - toCompare < 1E-6))

v = c(1,1,1,1,2,2,2,2,1,1,1,1)
toTest = as.vector(matrixToTest %*% v)
toCompare = c(0,0,0,-5,5,0,0,0,5,-5)
expect_true(all(toTest - toCompare < 1E-6))

})


test_that("Test 11", {

timeKnots = c(1,6,11)
times = 1:11
seasons = c(1,2,3,4,5,1,2,3,4,5)
data = (1:length(times))^2-7
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(1,2,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure, lambdas = c(1,2,3))

matrixToTest = as.matrix(predictorRegulariser(predictor))

# I do not know how to test it...

})


test_that("Test 12", {

timeKnots = c(1,6,11)
times = 1:11
seasons = c(1,2,3,4,5,1,2,3,4,5,1)
data = (1:length(times))^2-7
seasonalStructure = list(segments = list(c(0,5)), sKnots = list(1,2,3,4,c(5,0)))
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure, lambdas = c(1,2,3))
predictors = list(predictor, predictor)

matrixToTest = as.matrix(constructorMatrix(predictors)$matrix)
seats = constructorMatrix(predictors)$seats
matrixToTest2 = as.matrix(regulariserMatrix(predictors)$matrix)
matrixToTest3 = as.matrix(designMatrix(predictors))
matrixToTest4 = designMatrix(predictors)

# I do not know how to test it...

})


test_that("Test 13", {

knots = c(1,2,3,4)
expect_true(all(abs(tWeights(knots, norm = 1) - c(0.5, 1, 1, 0.5)) < 1E-6))

knots = c(1,3,7)
expect_true(all(abs(tWeights(knots, norm = 1) - c(1, 3, 2)) < 1E-6))

})


test_that("Test 14", {

expect_true(translST(s = 1, t = 1, nSKnots = 3) == 1)
expect_true(translST(s = 2, t = 1, nSKnots = 3) == 2)
expect_true(translST(s = 3, t = 1, nSKnots = 3) == 3)
expect_true(translST(s = 1, t = 2, nSKnots = 3) == 4)

})


test_that("Test 15", {

seasonalStructure = list(segments = list(c(0,4)), sKnots = list(1,2,3,c(4,0)))

seasons = c(2,3,4,1,2,3,4,1,2,3,4,1)
times = seq_along(seasons)
data = rep(1, length(seasons))
timeKnots = c(1,5,9)
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure, lambdas = c(1,2,3))

fullDataVector = c(
  1, -1, 1, -1,
  1, -1, 1, -1,
  1, -1, 1, -1
)
fullDataMatrix = matrix(fullDataVector, 4, 3)
reducedDataMatrix = fullDataMatrix[1:3,]
v = as.vector(reducedDataMatrix)

ssr = as.matrix(ssRegulariser(predictor, norm = 1))
r = ssr %*% v
m = matrix(r, 4, 3)
expect_true(all(m[,1] == 8 * c(-1, 1, -1, 1)))
expect_true(all(m[,2] == 16 * c(-1, 1, -1, 1)))
expect_true(all(m[,3] == 8 * c(-1, 1, -1, 1)))

ttr = as.matrix(ttRegulariser(predictor, norm = 2))
r = ttr %*% v
expect_true(all(abs(r) < 1E-6))

str = as.matrix(stRegulariser(predictor, norm = 2))
r = str %*% v
expect_true(all(abs(r) < 1E-6))

#############################################

fullDataVector = c(
  1, -1, 1, -1,
  2, -2, 2, -2,
  3, -3, 3, -3
)
fullDataMatrix = matrix(fullDataVector, 4, 3)
reducedDataMatrix = fullDataMatrix[1:3,]
v = as.vector(reducedDataMatrix)

ssr = as.matrix(ssRegulariser(predictor, norm = 1))
r = ssr %*% v
m = matrix(r, 4, 3)
expect_true(all(m[,1] == 8 * c(-1, 1, -1, 1)))
expect_true(all(m[,2] == 32 * c(-1, 1, -1, 1)))
expect_true(all(m[,3] == 24 * c(-1, 1, -1, 1)))

ttr = as.matrix(ttRegulariser(predictor, norm = 2))
r = ttr %*% v
expect_true(all(abs(r) < 1E-6))

str = as.matrix(stRegulariser(predictor, norm = 1))
r = str %*% v
m = matrix(r, 4, 2)
expect_true(all(m[,1] == 2 * c(-1, 1, -1, 1)))
expect_true(all(m[,2] == 2 * c(-1, 1, -1, 1)))

#############################################

fullDataVector = c(
  1, -1, 1, -1,
  -1, 1, -1, 1,
  1, -1, 1, -1
)
fullDataMatrix = matrix(fullDataVector, 4, 3)
reducedDataMatrix = fullDataMatrix[1:3,]
v = as.vector(reducedDataMatrix)

ssr = as.matrix(ssRegulariser(predictor, norm = 1))
r = ssr %*% v
m = matrix(r, 4, 3)
expect_true(all(m[,1] == 8 * c(-1, 1, -1, 1)))
expect_true(all(m[,2] == -16 * c(-1, 1, -1, 1)))
expect_true(all(m[,3] == 8 * c(-1, 1, -1, 1)))

ttr = as.matrix(ttRegulariser(predictor, norm = 1))
r = ttr %*% v
expect_true(all(r == c(1, -1, 1, -1)))

str = as.matrix(stRegulariser(predictor, norm = 1))
r = str %*% v
m = matrix(r, 4, 2)
expect_true(all(m[,1] == 4 * c(1, -1, 1, -1)))
expect_true(all(m[,2] == -4 * c(1, -1, 1, -1)))

})


test_that("Test 18", {

seasonalStructure = list(segments = list(c(0,4)), sKnots = list(1,3,c(4,0)))

seasons = c(2,3,4,1,2,3,4,1,2,3,4,1)
times = seq_along(seasons)
data = rep(1, length(seasons))
timeKnots = c(1,7,9)
predictor = list(data = data, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure, lambdas = c(5,0,2))

fullDataVector = c(
  1, -1, 0,
  -1, 1, 0,
  1, -1, 0
)
fullDataMatrix = matrix(fullDataVector, 3, 3)
reducedDataMatrix = fullDataMatrix[1:2,]
v = as.vector(reducedDataMatrix)

ssr = as.matrix(ssRegulariser(predictor, norm = 2))
r = ssr %*% v
m = matrix(r, 3, 3)

dts12 = (1/6 + 1/2)*2
w2s = 1.5
w1t = 3
dw12 = dts12*sqrt(w2s*w1t)
rv = c(-dw12, dw12, 0)
expect_true(all(abs(m[,1] - rv) < 1E-6))

w2t = 4
dw22 = dts12*sqrt(w2s*w2t)
rv = c(dw22, -dw22, 0)
expect_true(all(abs(m[,2] - rv) < 1E-6))

w3t = 1
dw32 = dts12*sqrt(w2s*w3t)
rv = c(-dw32, dw32, 0)
expect_true(all(abs(m[,3] - rv) < 1E-6))

ttr = as.matrix(ttRegulariser(predictor, norm = 2))
r = ttr %*% v
d = 1/3
dw = d * sqrt(4*1.5)
rv = c(dw, -dw, 0)
expect_true(all(abs(r - rv) < 1E-6))

str = as.matrix(stRegulariser(predictor, norm = 2))
r = str %*% v
m = matrix(r, 3, 2)

rv1 = c(2/sqrt(3), -2/sqrt(6), -2/sqrt(6))
expect_true(all(abs(m[,1] - rv1) < 1E-6))
rv2 = c(-2, 2/sqrt(2), 2/sqrt(2))
expect_true(all(abs(m[,2] - rv2) < 1E-6))

})


test_that("Test 19", {

l = list(list(data = c(1,3,4,5)), list(data = c(4,7,0,2)))
expect_true(all(getLimits(l) == c(0, 7)))

})


test_that("Test 20", {

n = 5
trendSeasonalStructure = list(segments = list(c(0,1)), sKnots = list(c(1,0)))
trend = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = 1:n, seasonalStructure = trendSeasonalStructure, lambdas = c(1,0,0))

toTest = as.matrix(ttRegulariser(trend, norm = 2))

v = 1:n
expect_true(all(abs(toTest %*% v) < 1E-6))

})


test_that("Test 21", {

for(n in 55:71) {
  trendSeasonalStructure = list(segments = list(c(0,1)), sKnots = list(c(1,0)))
  timeKnots1 = 1:n
  trend1 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = 1:n, seasonalStructure = trendSeasonalStructure, lambdas = c(1,0,0))
  timeKnots2 = sort(union(seq(1, n, by = 2), c(1,2,n,n-1)))
  trend2 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = trendSeasonalStructure, lambdas = c(1,0,0))

  times3 = seq(1, n, by = 3)
  times4 = seq(1, n, by = 3)
  timeKnots3 = sort(union(setdiff(setdiff(timeKnots1, times3),times4),c(1,2,n-1,n)))
  trend3 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots3, seasonalStructure = trendSeasonalStructure, lambdas = c(1,0,0))

  toTest1 = as.matrix(ttRegulariser(trend1, norm = 1))
  toTest2 = as.matrix(ttRegulariser(trend2, norm = 1))
  toTest3 = as.matrix(ttRegulariser(trend3, norm = 1))

  v1 = ((1:n)/n)^2
  v2 = v1[timeKnots2]
  v3 = v1[timeKnots3]
  expect_true(abs(sum(abs(toTest1 %*% v1))/sum(abs(toTest2 %*% v2)) - 1) < 1E-5)
  expect_true(abs(sum(abs(toTest1 %*% v1))/sum(abs(toTest3 %*% v3)) - 1) < 1E-5)

  toTest1 = as.matrix(ttRegulariser(trend1, norm = 2))
  toTest2 = as.matrix(ttRegulariser(trend2, norm = 2))
  toTest3 = as.matrix(ttRegulariser(trend3, norm = 2))

  expect_true(abs(sum((toTest1 %*% v1)^2)/sum((toTest2 %*% v2)^2) - 1) < 1E-5)
  expect_true(abs(sum((toTest1 %*% v1)^2)/sum((toTest3 %*% v3)^2) - 1) < 1E-5)
}

})


test_that("Test 22", {

n = 101
by = 0.1
sKnots = c(as.list(setdiff(seq(0,1,by = by), c(0,1))), list(c(1,0)))
seasonalStructure = list(segments = list(c(0,1)), sKnots = sKnots)
timeKnots1 = 1:n
s1 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = 1:n, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))
timeKnots2 = sort(union(seq(1, n, by = 2),c(1,2,n-1,n)))
s2 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))

v1 = ((1:n)/n)^2
vv1 = as.vector(sapply(v1, FUN = function(x) rep(x, length(sKnots)-1)))
v2 = v1[timeKnots2]
vv2 = as.vector(sapply(v2, FUN = function(x) rep(x, length(sKnots)-1)))

toTest1 = as.matrix(ttRegulariser(s1, norm = 2))
toTest2 = as.matrix(ttRegulariser(s2, norm = 2))

# length(vv1)
# dim(toTest1)

expect_true(abs(sum((toTest1 %*% vv1)^2)/sum((toTest2 %*% vv2)^2)-1) < 1E-5)

})


test_that("Test 23", {

n = 30
by = 0.005
by2 = 0.0025
intKnots = setdiff(seq(0,1,by = by), c(0,1))
intKnots2 = setdiff(seq(0,1,by = by2), c(0,1))
sKnots = c(as.list(intKnots), list(c(1,0)))
sKnots2 = c(as.list(intKnots2), list(c(1,0)))
seasonalStructure = list(segments = list(c(0,1)), sKnots = sKnots)
seasonalStructure2 = list(segments = list(c(0,1)), sKnots = sKnots2)
timeKnots1 = 1:n
s1 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = 1:n, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))
timeKnots2 = sort(union(seq(1, n, by = 2),c(1,2,n-1,n)))
s2 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))
s3 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = seasonalStructure2, lambdas = c(1,0,0))

sinv = sin(intKnots*2*pi)
sinv2 = sin(intKnots2*2*pi)
expect_true(sum(sinv) < 1E-6)
expect_true(sum(sinv2) < 1E-6)
v1 = ((1:n)/n)^2
vv1 = as.vector(sapply(v1, FUN = function(x) x*sinv))
v2 = v1[timeKnots2]
vv2 = as.vector(sapply(v2, FUN = function(x) x*sinv))
vv3 = as.vector(sapply(v2, FUN = function(x) x*sinv2))

toTest1 = as.matrix(ttRegulariser(s1, norm = 2))
toTest2 = as.matrix(ttRegulariser(s2, norm = 2))
toTest3 = as.matrix(ttRegulariser(s3, norm = 2))

expect_true(abs(sum((toTest1 %*% vv1)^2)/sum((toTest2 %*% vv2)^2)-1) < 1E-5)
expect_true(abs(sum((toTest1 %*% vv1)^2)/sum((toTest3 %*% vv3)^2)-1) < 1E-5)

toTest1 = as.matrix(ttRegulariser(s1, norm = 1))
toTest2 = as.matrix(ttRegulariser(s2, norm = 1))
toTest3 = as.matrix(ttRegulariser(s3, norm = 1))

expect_true(abs(sum(abs(toTest1 %*% vv1))/sum(abs(toTest2 %*% vv2))-1) < 1E-5)
expect_true(abs(sum(abs(toTest1 %*% vv1))/sum(abs(toTest3 %*% vv3))-1) < 1E-4)

})


test_that("Test 24", {

n = 30
k = 100
intSet = 1:(k-1)
intSet2 = setdiff(intSet, seq(1, k-1, by = 3))
intKnots = intSet/k
intKnots2 = intSet2/k
sKnots = c(as.list(intKnots), list(c(1,0)))
sKnots2 = c(as.list(intKnots2), list(c(1,0)))
seasonalStructure = list(segments = list(c(0,1)), sKnots = sKnots)
seasonalStructure2 = list(segments = list(c(0,1)), sKnots = sKnots2)
timeKnots1 = 1:n
s1 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = 1:n, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))
timeKnots2 = sort(union(seq(1, n, by = 2),c(1,2,n-1,n)))
s2 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))
s3 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = seasonalStructure2, lambdas = c(1,0,0))

sinv = sin(intKnots*2*pi)
sinv2 = sin(intKnots2*2*pi)
expect_true(sum(sinv) < 1E-6)
expect_true(sum(sinv2) < 1E-6)
v1 = ((1:n)/n)^2
vv1 = as.vector(sapply(v1, FUN = function(x) x*sinv))
v2 = v1[timeKnots2]
vv2 = as.vector(sapply(v2, FUN = function(x) x*sinv))
vv3 = as.vector(sapply(v2, FUN = function(x) x*sinv2))

toTest1 = as.matrix(ttRegulariser(s1, norm = 2))
toTest2 = as.matrix(ttRegulariser(s2, norm = 2))
toTest3 = as.matrix(ttRegulariser(s3, norm = 2))

expect_true(abs(sum((toTest1 %*% vv1)^2)/sum((toTest2 %*% vv2)^2)-1) < 1E-5)
expect_true(abs(sum((toTest1 %*% vv1)^2)/sum((toTest3 %*% vv3)^2)-1) < 1E-4)

toTest1 = as.matrix(ttRegulariser(s1, norm = 1))
toTest2 = as.matrix(ttRegulariser(s2, norm = 1))
toTest3 = as.matrix(ttRegulariser(s3, norm = 1))

expect_true(abs(sum(abs(toTest1 %*% vv1))/sum(abs(toTest2 %*% vv2))-1) < 1E-5)
expect_true(abs(sum(abs(toTest1 %*% vv1))/sum(abs(toTest3 %*% vv3))-1) < 1E-3)

})


test_that("Test 25", {

n = 30
k = 100
intSet = 1:(k-1)
intSet2 = setdiff(intSet, seq(1, k-1, by = 3))
intKnots = intSet/k
intKnots2 = intSet2/k
sKnots = c(as.list(intKnots), list(c(1,0)))
sKnots2 = c(as.list(intKnots2), list(c(1,0)))
seasonalStructure = list(segments = list(c(0,1)), sKnots = sKnots)
seasonalStructure2 = list(segments = list(c(0,1)), sKnots = sKnots2)
timeKnots1 = 1:n
s1 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = 1:n, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))
timeKnots2 = sort(union(seq(1, n, by = 2),c(1,2,n-1,n)))
s2 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))
s3 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = seasonalStructure2, lambdas = c(1,0,0))

sinv = sin(intKnots*2*pi)
sinv2 = sin(intKnots2*2*pi)
expect_true(sum(sinv) < 1E-6)
expect_true(sum(sinv2) < 1E-6)
v1 = ((1:n)/n)^2
vv1 = as.vector(sapply(v1, FUN = function(x) x*sinv))
v2 = v1[timeKnots2]
vv2 = as.vector(sapply(v2, FUN = function(x) x*sinv))
vv3 = as.vector(sapply(v2, FUN = function(x) x*sinv2))

toTest1 = as.matrix(stRegulariser(s1, norm = 2))
toTest2 = as.matrix(stRegulariser(s2, norm = 2))
toTest3 = as.matrix(stRegulariser(s3, norm = 2))

expect_true(abs(sum((toTest1 %*% vv1)^2)/sum((toTest2 %*% vv2)^2)-1) < 1E-3)
expect_true(abs(sum((toTest1 %*% vv1)^2)/sum((toTest3 %*% vv3)^2)-1) < 5E-2)

toTest1 = as.matrix(stRegulariser(s1, norm = 1))
toTest2 = as.matrix(stRegulariser(s2, norm = 1))
toTest3 = as.matrix(stRegulariser(s3, norm = 1))

expect_true(abs(sum(abs(toTest1 %*% vv1))/sum(abs(toTest2 %*% vv2))-1) < 1E-5)
expect_true(abs(sum(abs(toTest1 %*% vv1))/sum(abs(toTest3 %*% vv3))-1) < 1E-3)

})


test_that("Test 26", {

n = 30
k = 100
intSet = 1:(k-1)
intSet2 = setdiff(intSet, seq(1, k-1, by = 2))
intKnots = intSet/k
intKnots2 = intSet2/k
sKnots = c(as.list(intKnots), list(c(1,0)))
sKnots2 = c(as.list(intKnots2), list(c(1,0)))
seasonalStructure = list(segments = list(c(0,1)), sKnots = sKnots)
seasonalStructure2 = list(segments = list(c(0,1)), sKnots = sKnots2)
timeKnots1 = 1:n
s1 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = 1:n, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))
timeKnots2 = sort(union(seq(1, n, by = 2),c(1,2,n-1,n)))
s2 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = seasonalStructure, lambdas = c(1,0,0))
s3 = list(data = rep(1, n), times = 1:n, seasons = rep(1, n), timeKnots = timeKnots2, seasonalStructure = seasonalStructure2, lambdas = c(1,0,0))

sinv = sin(intKnots*2*pi)
sinv2 = sin(intKnots2*2*pi)
expect_true(sum(sinv) < 1E-6)
expect_true(sum(sinv2) < 1E-6)
v1 = ((1:n)/n)^2
vv1 = as.vector(sapply(v1, FUN = function(x) x*sinv))
v2 = v1[timeKnots2]
vv2 = as.vector(sapply(v2, FUN = function(x) x*sinv))
vv3 = as.vector(sapply(v2, FUN = function(x) x*sinv2))

toTest1 = as.matrix(ssRegulariser(s1, norm = 2))
toTest2 = as.matrix(ssRegulariser(s2, norm = 2))
toTest3 = as.matrix(ssRegulariser(s3, norm = 2))

expect_true(abs(sum((toTest1 %*% vv1)^2)/sum((toTest2 %*% vv2)^2)-1) < 5E-2)
expect_true(abs(sum((toTest1 %*% vv1)^2)/sum((toTest3 %*% vv3)^2)-1) < 5E-2)

toTest1 = as.matrix(ssRegulariser(s1, norm = 1))
toTest2 = as.matrix(ssRegulariser(s2, norm = 1))
toTest3 = as.matrix(ssRegulariser(s3, norm = 1))

expect_true(abs(sum(abs(toTest1 %*% vv1))/sum(abs(toTest2 %*% vv2))-1) < 5E-2)
expect_true(abs(sum(abs(toTest1 %*% vv1))/sum(abs(toTest3 %*% vv3))-1) < 5E-2)

})


test_that("Test 27", {

n = 50
trendSeasonalStructure = list(segments = list(c(0,1)), sKnots = list(c(1,0)))
ns = 5
seasonalStructure = list(segments = list(c(0,ns)), sKnots = c(as.list(1:(ns-1)),list(c(ns,0))))
seasons = rep(1:ns,n%/%ns+1)[1:n]
trendSeasons = rep(1, length(seasons))
times = seq_along(seasons)
data = seasons + times/4
plot(times, data, type = "l")
timeKnots = times
trendData = rep(1, n)
seasonData = rep(1, n)
trend = list(data = trendData, times = times, seasons = trendSeasons, timeKnots = timeKnots, seasonalStructure = trendSeasonalStructure, lambdas = c(1,0,0))
season = list(data = seasonData, times = times, seasons = seasons, timeKnots = timeKnots, seasonalStructure = seasonalStructure, lambdas = c(10,0,0))
predictors = list(trend, season)

str1 = STRmodel(data, predictors)

# plot(str1$output$random$data, type = "l")
# plot(str1$output$predictors[[1]]$data, type = "l")
# plot(str1$output$predictors[[2]]$data, type = "l")

plot(str1)

oldData = data


data = oldData
data[c(3,4,7,20,24,29,35,37,45)] = NA
plot(times, data, type = "l")
str2 = STRmodel(data, predictors)
plot(str2)

data = data + rnorm(length(data), 0, 0.2)
plot(times, data, type = "l")
str3 = STRmodel(data, predictors)
plot(str3)

str4 = STRmodel(data, predictors, confidence = 0.95)
plot(str4)

})
