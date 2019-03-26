library(surveillance)


### Name: stK
### Title: Diggle et al (1995) K-function test for space-time clustering
### Aliases: stKtest plot.stKtest
### Keywords: htest

### ** Examples

if (requireNamespace("splancs")) {
    data("imdepi")
    imdepiB <- subset(imdepi, type == "B")
    mainpoly <- coordinates(imdepiB$W@polygons[[1]]@Polygons[[5]])
    if (surveillance.options("allExamples")) {
        SGRID <- c(0, 10, 25, 50, 75, 100, 150, 200)
        TGRID <- c(0, 7, 14, 21, 28)
        B <- 99
        CORES <- 2
    } else { # dummy settings for fast CRAN checks
        SGRID <- c(0, 50)
        TGRID <- c(0, 30)
        B <- 9
        CORES <- 1
    }
    imdBstKtest <- stKtest(imdepiB, eps.s = SGRID, eps.t = TGRID, B = B,
                           cores = CORES, seed = 1, poly = list(mainpoly))
    print(imdBstKtest)
    plot(imdBstKtest)
}



