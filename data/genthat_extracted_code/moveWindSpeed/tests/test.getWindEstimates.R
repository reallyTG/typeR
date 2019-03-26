context("Generated examples")
test_that("getWindEstimates", {
  data("storks")
  expect_s4_class((tmp <-
                     getWindEstimates(
                       storks[[1:2]],
                       isFocalPoint = function(i, ts) {
                         (as.numeric(i) %% 10) == 4
                       }
                     )), "MoveStack")
  expect_equivalent(getWindEstimates(
    storks[[1:2]],
    isFocalPoint = function(i, ts) {
      as.numeric(ts) %% 10 == 3
    }
  ),
  moveStack(list(
    getWindEstimates(
      storks[[1]],
      isFocalPoint = function(i, ts) {
        as.numeric(ts) %% 10 == 3
      }
    ),
    getWindEstimates(
      storks[[2]],
      isFocalPoint = function(i, ts) {
        as.numeric(ts) %% 10 == 3
      }
    )
  )))
})
test_that("sim trk", {
  set.seed(35433)
  sd <- .2
  s <- rnorm(100, 10, sd = sd)
  h <- (1:length(s)) / 2
  w <- 4:5
  d <- data.frame(
    t = 1:length(s),
    vx = w[1] + sin(h) * s,
    vy = w[2] + cos(h) * s
  )
  t <- getWindEstimates(d[, -1], tt <- Sys.time() + d$t, windowSize = 21)
  expect_true(all(na.omit(t$estimationSuccessful)))
  
  expect_identical(
    getWindEstimates(
      d[, -1],
      tt,
      windowSize = 21,
      isThermallingFunction = getDefaultIsThermallingFunction(minMeanSpeed = 4)
    ),
    t
  )
  expect_identical(
    getWindEstimates(
      d[, -1],
      tt,
      windowSize = 21,
      isThermallingFunction =
        getDefaultIsThermallingFunction(minMeanSpeed = 9)
    )
    ,
    t
  )
expect_true(all(na.omit(!getWindEstimates(
    d[, -1],
    tt,
    windowSize = 21,
    isThermallingFunction =
      getDefaultIsThermallingFunction(minMeanSpeed = 11)
  )$estimationSuccessful)))
  
})
test_that("groundspeedchar",{
  data(storks)
  storks$spd<-unlist(lapply(speed(storks), c, NA))
  storks$ang<-unlist(lapply(angle(storks), c, NA))
  storks$fx<-storks$spd*sin(storks$ang/180 *pi)
  storks$fy<-storks$spd*cos(storks$ang/180 *pi)
  expect_equal(
    a <-
      getWindEstimates(
        storks,
        isFocalPoint = function(i, ts) {
          (as.numeric(ts) %% 143) == 2
        }
      ),
    b <-
      getWindEstimates(
        storks,
        groundSpeedXY = c("fx", "fy"),
        isFocalPoint = function(i, ts) {
          (as.numeric(ts) %% 143) == 2
        }
      )
  )
  storks2 <- storks
  storks2@coords <- coordinates(storks2) + rnorm(2)
  expect_equal(data.frame(a <-
                            getWindEstimates(
                              storks,
                              isFocalPoint = function(i, ts) {
                                (as.numeric(ts) %% 143) == 2
                              }
                            ))[, c("windX", "windY", "windCovarXY")],
               data.frame(
                 b <-
                   getWindEstimates(
                     storks2,
                     groundSpeedXY = c("fx", "fy"),
                     isFocalPoint = function(i, ts) {
                       (as.numeric(ts) %% 143) == 2
                     }
                   )
               )[, c("windX", "windY", "windCovarXY")])
})
test_that('isfocalfunction',{
  data("storks")
  i<-storks[[5]]
  set.seed(3245246)
  f<-sort(sample(1:n.locs(i),size = 200))
  fun<-function(i,ts){i%in%f}
  expect_equal(
    getWindEstimates(i, isFocalPoint=f),
    getWindEstimates(i, isFocalPoint=fun))

  i<-storks[[3:4]]
  f<-sort(sample(1:sum(n.locs(i)),size = 200))
  fun<-function(i,ts){i%in%f}
  expect_equal(
    getWindEstimates(i, isFocalPoint=f),
    getWindEstimates(i, isFocalPoint=fun))
  
  
  })
