library(quadprogXT)

Amat <- matrix(c(-4,-3,0,2,1,0,0,-2,1),3,3)
AindCompact <- rbind(c(2,2,2),c(1,1,2),c(2,2,3))
AmatCompact <- rbind(c(-4,2,-2),c(-3,1,1))

test_that("Conversion to compact program yields same results as quadprog example", {    
    expect_equal(convertToCompact(Amat), list(Amat = AmatCompact, Aind = AindCompact))
})

test_that("Conversion to compact program fails when there is > 0 columns of all 0s", {    
    expect_error(convertToCompact(Amat * 0))
})

