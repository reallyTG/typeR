context("Correctness of cubature methods")

### set up test case

## bivariate, isotropic Gaussian density
f <- function (s, mean, sd)
    dnorm(s[,1], mean=mean[1], sd=sd) * dnorm(s[,2], mean=mean[2], sd=sd)

## circular domain represented by a polygon
r <- 5
center <- c(3,2)
npoly <- 128
disc.owin <- spatstat::disc(radius=r, centre=center, npoly=npoly)

## parameters for f
m <- c(1,1)
sd <- 3

## target value of the integral over the _polygonal_ circle
intExact <- 0.65844436

## taken from exact.Gauss cubature
test_that("gpclibCheck() fails without prior license agreement", {
    if (gpclibPermitStatus())
        skip("gpclib license has already been accepted")
    expect_error(polyCub:::gpclibCheck())
})
if (requireNamespace("mvtnorm") && gpclibPermit()) {
    ## run this conditionally since gpclib might not be available on all
    ## platforms (as pointed out by Uwe Ligges, 2014-04-20)
    test_that("polyCub.exact.Gauss returns validated result", {
        int <- polyCub.exact.Gauss(disc.owin, mean=m, Sigma=sd^2*diag(2))
        expect_equal(int, intExact, tolerance=1e-8, check.attributes=FALSE)
    })
}


### perform the tests (check against each other)

test_that("polyCub.exact.Gauss and circleCub.Gauss give similar results", {
    ## exact value of the integral over the _real_ circle
    intExact_circle <- circleCub.Gauss(center=center, r=r, mean=m, sd=sd)

    ## how well this fits with the exact integral over a polyonal approximation
    ## of the circle depends of course on 'npoly'
    expect_equal(intExact, intExact_circle,
                 tolerance=0.001, check.attributes=FALSE)
})

test_that("midpoint-cubature is correct", {
    int <- polyCub.midpoint(disc.owin, f, mean=m, sd=sd, dimyx=500)
    expect_equal(int, intExact, tolerance=0.001, check.attributes=FALSE)
})

test_that("SV-cubature is correct", {
    intC <- polyCub.SV(disc.owin, f, mean=m, sd=sd, nGQ=3, engine="C")
    intR <- polyCub.SV(disc.owin, f, mean=m, sd=sd, nGQ=3, engine="R")
    expect_equal(intC, intR)
    expect_equal(intC, intExact, tolerance=0.0001, check.attributes=FALSE)
})

test_that("isotropic cubature is correct", {
    ## using a numerical approximation of intrfr
    int0 <- polyCub.iso(disc.owin, f, mean=m, sd=sd, center=m)
    expect_equal(int0, intExact, check.attributes=FALSE)
})
