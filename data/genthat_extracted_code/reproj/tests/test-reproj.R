context("reproj")

## TODO: Rename context
## TODO: Add more tests

llproj <- "+proj=longlat +datum=WGS84"
laeaproj <- "+proj=laea +datum=WGS84"

# library(proj4)
# dat <- as.matrix(expand.grid(x = seq(-180, 180), y = seq(-90, 90)))
# dat <- dat[sample(nrow(dat), 10), ]
# pdat <- proj4::ptransform(dat * pi/180, llproj, laeaproj)
# dput(dat)
# dput(pdat)
dat <- structure(c(-162L, -97L, -162L, 40L, -36L, 32L, 32L, -67L, -25L,
            -22L, 14L, -31L, 52L, -49L, -1L, -11L, 38L, 66L, -65L, 32L), .Dim = c(10L,
                                                                                  2L), .Dimnames = list(NULL, c("x", "y")))

pdat <- structure(c(-9752052.25396846, -8119467.86794594, -2678218.88894421,
            3109728.10218706, -3941443.47017694, 3466582.53790106, 2920150.83154972,
            -3147972.12215379, -1374249.03919241, -2146112.98562162, 7815696.43338213,
            -4882405.39621803, 11018883.0376461, -5528095.07432074, -116262.853667621,
            -1263068.91163095, 4276503.16642679, 7629667.99984509, -6926735.4349356,
            3555900.89373428), .Dim = c(10L,
                                                                      2L))

## assume 3 column
pdat <- cbind(pdat, 0)
dat <- cbind(dat, 0)
test_that("basic reprojection works", {
  expect_equivalent(reproj(dat, source = llproj, target = laeaproj), pdat)
  expect_equivalent(reproj(pdat, source = laeaproj, target = llproj), dat)
})

test_that("identity reprojection ok", {
  expect_equivalent(reproj(dat, source = llproj, target = llproj), dat)
  expect_equivalent(reproj(pdat, source = laeaproj, target = laeaproj), pdat)
})

test_that("unit change", {
  expect_equivalent(reproj(dat, source = llproj, target = "+proj=laea +ellps=WGS84 +units=km"), pdat/1000)
  expect_equivalent(reproj(dat, source = llproj, target = laeaproj), pdat)
})

test_that("basic with data frame works", {
  expect_equivalent(reproj(as.data.frame(dat), source = llproj, target = laeaproj), pdat)
  expect_equivalent(reproj(as.data.frame(pdat), source = laeaproj, target = llproj), dat)
})

test_that("bad arguments fail", {
  expect_error(reproj(dat, llproj, target = llproj))
  expect_error(reproj(pdat, laeaproj, target = laeaproj))
})

