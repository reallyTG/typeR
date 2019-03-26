context("Consistency between mean total copy numbers and region labels")

getTotalCopyNumbers <- function(dataSet, tumorFraction) {
    dat <- loadCnRegionData(dataSet=dataSet, tumorFraction=tumorFraction)
    C1C2 <- getMinorMajorCopyNumbers(dat$region)
    dat$trueC <- rowSums(C1C2)
    meanC <- tapply(dat$c, dat$trueC, mean, na.rm=TRUE)
    trueC <- as.numeric(names(meanC))
    meanC[order(trueC)]
}

test_that("Ordering of mean total copy number is consistent with region annotation", {
    for (dataSet in listDataSets()) {
        for (tumorFraction in listTumorFractions(dataSet)) {
            if (tumorFraction==0) {
                next;
            }
            tcn <- getTotalCopyNumbers(dataSet, tumorFraction)
            expect_equal(order(tcn), seq(along=tcn))
        }
    }
})
