context("Creation of realistic synthetic copy number profiles by 'getCopyNumberDataByResampling'")

tf <- 1
affyDat <- loadCnRegionData(dataSet="GSE29172", tumorFraction=tf)
sim <- getCopyNumberDataByResampling(len=1e4, nBkp=2, minLength=100, regData=affyDat)

Y <- sim$profile
bkp <- sim$bkp
regions <- sim$regions

test_that("Output cellularity is consistent with input", {
              cl <- unique(Y$cellularity)
              expect_identical(cl, tf)
          })

test_that("Number of breakpoints + 1 is number of regions", {
              nBkp <- length(bkp)
              nReg <- length(regions)
              expect_equal(nBkp+1, nReg)

              regs <- as.factor(Y[["region"]])
              nBkp2 <- sum(diff(as.numeric(regs))!=0)
              expect_equal(nBkp, nBkp2)
          })

test_that("Output breakpoints are identical to input when provided", {
              sim2 <- getCopyNumberDataByResampling(1e4, bkp=bkp, regData=affyDat)
              expect_identical(sim2$bkp, bkp)
          })

test_that("Output regions are identical to input when provided", {
              sim3 <- getCopyNumberDataByResampling(1e4, regions=regions, regData=affyDat)
              expect_identical(sim3$regions, regions)
          })
