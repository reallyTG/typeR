context("Presence of all germline genotypes")

allGenotypes <- function(dataSet, tumorFraction) {
    dat <- loadCnRegionData(dataSet=dataSet, tumorFraction=tumorFraction)
    gens <- unique(dat$genotype)
    sort(gens[which(!is.na(gens))])
}

test_that("Genotypes AA, AB and BB are represented in data set 'GSE11976_CRL2324'", {
    dataSet <- "GSE11976_CRL2324"
    for (tumorFraction in listTumorFractions(dataSet)) {
        gens <- allGenotypes(dataSet, tumorFraction=tumorFraction)
        expect_equal(gens, c(0, 0.5, 1))
    }
})

test_that("Genotypes AA, AB and BB are represented in data set 'GSE13372_HCC1143'", {
    dataSet <- "GSE13372_HCC1143"
    for (tumorFraction in listTumorFractions(dataSet)) {
        gens <- allGenotypes(dataSet, tumorFraction=tumorFraction)
        expect_equal(gens, c(0, 0.5, 1))
    }
})

test_that("Genotypes AA, AB and BB are represented in data set 'GSE29172_H1395'", {
    dataSet <- "GSE29172_H1395"
    for (tumorFraction in listTumorFractions(dataSet)) {
        gens <- allGenotypes(dataSet, tumorFraction=tumorFraction)
        expect_equal(gens, c(0, 0.5, 1))
    }
})
