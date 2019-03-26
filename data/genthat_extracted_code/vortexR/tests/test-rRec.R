library(vortexR)
library(vortexRdata)
context("test rRec")


test_that("rRec", {
    # Using Pacioni et al. example data. See ?pac.clas for more details.
    data(pac.clas)
    recov <- rRec(pac.clas, project="Pacioni_et_al", scenario="ST_Classic",
                  ST=TRUE, runs=3, yr0=1, yrt=120, save2disk=FALSE)

    expect_is(recov, "data.frame")
    expect_equal(dim(recov), c(24, 8))
})

