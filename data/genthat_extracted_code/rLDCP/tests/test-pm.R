context("text PM")

test_that("pm has the correct values for u,y,g,t", {

cp_depth <- cp("cp_depth",c("far", "bit far", "good", "close", "very close"))

g_depth <- function(u,y){
 y$w <- degree_mf(fuzzy_partitions(triangle_mf(450,450,550),
                                               triangle_mf(450,550,600),
                                               trapezoid_mf(550,600,800, 1000)),u)
}

t_depth <- function(u,y){
   return("Hello")
}

pm_depth  <- pm(y=cp_depth, g=g_depth)

  expect_that(class(pm_depth), equals("pm"))
  expect_that(pm_depth$u, equals(NULL))
  expect_that(pm_depth$y,equals(cp_depth))
  expect_that(pm_depth$g, equals(g_depth))
  expect_that(pm_depth$t, equals(NULL))

  pm_depth  <- pm(u=550,y=cp_depth, g=g_depth)
  expect_that(pm_depth$u, equals(550))
  expect_that(pm_depth$y,equals(cp_depth))
  expect_that(pm_depth$g, equals(g_depth))
  expect_that(pm_depth$t, equals(NULL))

  pm_depth  <- pm(u=550,y=cp_depth, g=g_depth, t=t_depth)
  expect_that(pm_depth$u, equals(550))
  expect_that(pm_depth$y,equals(cp_depth))
  expect_that(pm_depth$g, equals(g_depth))
  expect_that(pm_depth$t, equals(t_depth))

})

test_that("pm errors", {

  cp_depth <- cp("cp_depth",c("far", "bit far", "good", "close", "very close"))

  g_depth <- function(u,y){
    y$w <- degree_mf(fuzzy_partitions(triangle_mf(450,450,550),
                                      triangle_mf(450,550,600),
                                      trapezoid_mf(550,600,800, 1000)),u)
  }

 #t must be a function
  expect_error(pm(y=cp_depth, g=g_depth, t=5))
  #g must be a function
  expect_error(pm(y=cp_depth, g=5))
  #y must be a object of cp class
  expect_error(pm(y=5, g=g_depth))

})

test_that("pm_infer", {

  cp_depth <- cp("cp_depth",c("far", "bit far", "good", "close", "very close"))

  g_depth <- function(u,y){
    y$w <- degree_mf(fuzzy_partitions(triangle_mf(450,450,550),
                                      triangle_mf(450,550,600),
                                      trapezoid_mf(550,600,800, 1000)),u)
  y
  }
  pm_depth  <- pm(y=cp_depth, g=g_depth)
  pm_depth  <- pm_infer(pm_depth,550)

  expect_that(pm_depth$y$w, equals(c(0,1,0)))

  pm_depth  <- pm(u=550,y=cp_depth, g=g_depth)
  pm_depth  <- pm_infer(pm_depth)

  expect_that(pm_depth$y$w, equals(c(0,1,0)))

  #pm must be an instance of pm class
  expect_error(pm_infer(5))

})

test_that("pm_report", {

  cp_depth <- cp("cp_depth",c("far", "bit far", "good", "close", "very close"))

  g_depth <- function(u,y){
    y$w <- degree_mf(fuzzy_partitions(triangle_mf(450,450,550),
                                      triangle_mf(450,550,600),
                                      trapezoid_mf(550,600,800, 1000)),u)
    y
  }

  t_depth <- function(u,y){
    return("Hello")
  }

  pm_depth  <- pm(y=cp_depth,g=g_depth,t=t_depth)
  pm_report(pm_depth)

  expect_that( pm_report(pm_depth), equals("Hello"))

  #pm must be an instance of pm class
  expect_error(pm_report(5))

})

