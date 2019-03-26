library(testthat)
library(partitionComparison)
context("Pair comparison based measures")


test_that("the Rand index works correctly", {
  expect_equal(randIndex(random_partition, random_partition), 1)

  expect_equal(randIndex(p, q), 0.6)
  expect_equal(randIndex(q, p), 0.6)
  expect_equal(randIndex(p, r), 0.4)
  expect_equal(randIndex(p, s), 0.8)
  expect_equal(randIndex(r, s), 0.6)
})

test_that("the adjusted Rand index works correctly", {
  expect_equal(adjustedRandIndex(random_partition, random_partition), 1)

  expect_equal(adjustedRandIndex(p, q), 1/6)
  expect_equal(adjustedRandIndex(q, p), 1/6)
  expect_equal(adjustedRandIndex(p, r), -2/13)
  expect_equal(adjustedRandIndex(p, s), 6/11)
  expect_equal(adjustedRandIndex(r, s), 2/7)
})

test_that("the Jaccard coefficient works correctly", {
  expect_equal(jaccardCoefficient(random_partition, random_partition), 1)

  expect_equal(jaccardCoefficient(p, q), 1/3)
  expect_equal(jaccardCoefficient(q, p), 1/3)
  expect_equal(jaccardCoefficient(p, r), 1/4)
  expect_equal(jaccardCoefficient(p, s), 0.5)
  expect_equal(jaccardCoefficient(r, s), 1/3)
})

test_that("Wallace' index I works correctly", {
  expect_equal(wallaceI(random_partition, random_partition), 1)

  expect_equal(wallaceI(p, q), 0.5)
  expect_equal(wallaceI(q, p), 0.5)
  expect_equal(wallaceI(p, r), 0.5)
  expect_equal(wallaceI(p, s), 0.5)
  expect_equal(wallaceI(r, s), 1/3)
})

test_that("Wallace' index II works correctly", {
  expect_equal(wallaceII(random_partition, random_partition), 1)

  expect_equal(wallaceII(p, q), 0.5)
  expect_equal(wallaceII(q, p), 0.5)
  expect_equal(wallaceII(p, r), 1/3)
  expect_equal(wallaceII(p, s), 1)
  expect_equal(wallaceII(r, s), 1)
})

test_that("the index of Folwkes and Mallows works correctly", {
  expect_equal(folwkesMallowsIndex(random_partition, random_partition), 1)

  expect_equal(folwkesMallowsIndex(p, q), 0.5)
  expect_equal(folwkesMallowsIndex(q, p), 0.5)
  expect_equal(folwkesMallowsIndex(p, r), sqrt(6)/6)
  expect_equal(folwkesMallowsIndex(p, s), sqrt(2)/2)
  expect_equal(folwkesMallowsIndex(r, s), sqrt(3)/3)
})

test_that("the RV coefficient works correctly", {
  expect_equal(rvCoefficient(random_partition, random_partition), 1)

  expect_equal(rvCoefficient(p, q), 9/13)
  expect_equal(rvCoefficient(q, p), 9/13)
  expect_equal(rvCoefficient(p, r), 9*sqrt(221)/221)
  expect_equal(rvCoefficient(p, s), 3*sqrt(13)/13)
  expect_equal(rvCoefficient(r, s), 3*sqrt(17)/17)
})

test_that("the Mirkin metric index works correctly", {
  expect_equal(mirkinMetric(random_partition, random_partition), 0)

  expect_equal(mirkinMetric(p, q), 8)
  expect_equal(mirkinMetric(q, p), 8)
  expect_equal(mirkinMetric(p, r), 12)
  expect_equal(mirkinMetric(p, s), 4)
  expect_equal(mirkinMetric(r, s), 8)
})

test_that("the Minkowski measure works correctly", {
  expect_equal(minkowskiMeasure(random_partition, random_partition), 0)

  expect_equal(minkowskiMeasure(p, q), 1)
  expect_equal(minkowskiMeasure(q, p), 1)
  expect_equal(minkowskiMeasure(p, r), sqrt(6)/2)
  expect_equal(minkowskiMeasure(p, s), sqrt(2)/2)
  expect_equal(minkowskiMeasure(r, s), sqrt(6)/3)
})

test_that("the Gamma statistics works correctly", {
  expect_equal(gammaStatistics(random_partition, random_partition), 1)

  expect_equal(gammaStatistics(p, q), 1/6)
  expect_equal(gammaStatistics(q, p), 1/6)
  expect_equal(gammaStatistics(p, r), -1/6)
  expect_equal(gammaStatistics(p, s), sqrt(6)/4)
  expect_equal(gammaStatistics(r, s), sqrt(6)/6)
})

test_that("the Hamann coefficient works correctly", {
  expect_equal(hamann(random_partition, random_partition), 1)

  expect_equal(hamann(p, q), 0.2)
  expect_equal(hamann(q, p), 0.2)
  expect_equal(hamann(p, r), -0.2)
  expect_equal(hamann(p, s), 0.6)
  expect_equal(hamann(r, s), 0.2)
})

test_that("the Czekanowski index works correctly", {
  expect_equal(czekanowski(random_partition, random_partition), 1)

  expect_equal(czekanowski(p, q), 0.5)
  expect_equal(czekanowski(q, p), 0.5)
  expect_equal(czekanowski(p, r), 0.4)
  expect_equal(czekanowski(p, s), 2/3)
  expect_equal(czekanowski(r, s), 0.5)
})

test_that("the Kulczynski index works correctly", {
  expect_equal(kulczynski(random_partition, random_partition), 1)

  expect_equal(kulczynski(p, q), 0.5)
  expect_equal(kulczynski(q, p), 0.5)
  expect_equal(kulczynski(p, r), 5/12)
  expect_equal(kulczynski(p, s), 0.75)
  expect_equal(kulczynski(r, s), 2/3)
})

test_that("the McConnaughey index works correctly", {
  expect_equal(mcconnaughey(random_partition, random_partition), 1)
  
  expect_equal(mcconnaughey(p, q), 0)
  expect_equal(mcconnaughey(q, p), 0)
  expect_equal(mcconnaughey(p, r), -1/6)
  expect_equal(mcconnaughey(p, s), 0.5)
  expect_equal(mcconnaughey(r, s), 1/3)
})

test_that("the Peirce index works correctly", {
  expect_equal(peirce(random_partition, random_partition), 1)
  
  expect_equal(peirce(p, q), 1/6)
  expect_equal(peirce(q, p), 1/6)
  expect_equal(peirce(p, r), -1/6)
  expect_equal(peirce(p, s), 0.5)
  expect_equal(peirce(r, s), 1/3)
})

test_that("the index 1 of Sokal and Sneath works correctly", {
  expect_equal(sokalSneath1(random_partition, random_partition), 1)
  
  expect_equal(sokalSneath1(p, q), 7/12)
  expect_equal(sokalSneath1(q, p), 7/12)
  expect_equal(sokalSneath1(p, r), 5/12)
  expect_equal(sokalSneath1(p, s), 0.8125)
  expect_equal(sokalSneath1(r, s), 17/24)
})

test_that("the index 2 of Sokal and Sneath works correctly", {
  expect_equal(sokalSneath2(random_partition, random_partition), 1)
  
  expect_equal(sokalSneath2(p, q), 0.2)
  expect_equal(sokalSneath2(q, p), 0.2)
  expect_equal(sokalSneath2(p, r), 1/7)
  expect_equal(sokalSneath2(p, s), 1/3)
  expect_equal(sokalSneath2(r, s), 0.2)
})

test_that("the index 3 of Sokal and Sneath works correctly", {
  expect_equal(sokalSneath3(random_partition, random_partition), 1)
  
  expect_equal(sokalSneath3(p, q), 1/3)
  expect_equal(sokalSneath3(q, p), 1/3)
  expect_equal(sokalSneath3(p, r), 1/6)
  expect_equal(sokalSneath3(p, s), sqrt(6)/4)
  expect_equal(sokalSneath3(r, s), sqrt(6)/6)
})

test_that("the index 1 of Baulieu works correctly", {
  expect_equal(baulieu1(random_partition, random_partition), 1)
  
  expect_equal(baulieu1(p, q), 0.76)
  expect_equal(baulieu1(q, p), 0.76)
  expect_equal(baulieu1(p, r), 0.76)
  expect_equal(baulieu1(p, s), 0.84)
  expect_equal(baulieu1(r, s), 0.76)
})

test_that("the index 2 of Baulieu works correctly", {
  expect_equal(baulieu2(p, q), 0.04)
  expect_equal(baulieu2(q, p), 0.04)
  expect_equal(baulieu2(p, r), -0.04)
  expect_equal(baulieu2(p, s), 0.12)
  expect_equal(baulieu2(r, s), 0.08)
})

test_that("the index of Russel and Rao works correctly", {
  expect_equal(russelRao(p, q), 0.2)
  expect_equal(russelRao(q, p), 0.2)
  expect_equal(russelRao(p, r), 0.2)
  expect_equal(russelRao(p, s), 0.2)
  expect_equal(russelRao(r, s), 0.2)
})

test_that("the index of Fager and McGowan works correctly", {
  expect_equal(fagerMcGowan(p, q), 0.25)
  expect_equal(fagerMcGowan(q, p), 0.25)
  expect_equal(fagerMcGowan(p, r), sqrt(6)/6 - 1/4)
  expect_equal(fagerMcGowan(p, s), sqrt(2)/2 - 1/4)
  expect_equal(fagerMcGowan(r, s), sqrt(3/8 - sqrt(2)/6))
})

test_that("the index Pearson index works correctly", {
  expect_equal(pearson(p, q), 1/144)
  expect_equal(pearson(q, p), 1/144)
  expect_equal(pearson(p, r), -1/144)
  expect_equal(pearson(p, s), 0.03125)
  expect_equal(pearson(r, s), 1/48)
})

test_that("the index of Gower and Legendre works correctly", {
  expect_equal(gowerLegendre(random_partition, random_partition), 1)
  
  expect_equal(gowerLegendre(p, q), 0.75)
  expect_equal(gowerLegendre(q, p), 0.75)
  expect_equal(gowerLegendre(p, r), 4/7)
  expect_equal(gowerLegendre(p, s), 8/9)
  expect_equal(gowerLegendre(r, s), 0.75)
})

test_that("the index of Rogers and Tanimoto works correctly", {
  expect_equal(rogersTanimoto(random_partition, random_partition), 1)
  
  expect_equal(rogersTanimoto(p, q), 3/7)
  expect_equal(rogersTanimoto(q, p), 3/7)
  expect_equal(rogersTanimoto(p, r), 1/4)
  expect_equal(rogersTanimoto(p, s), 2/3)
  expect_equal(rogersTanimoto(r, s), 3/7)
})

test_that("the index of Goodman and Kruskal works correctly", {
  expect_equal(goodmanKruskal(random_partition, random_partition), 1)
  
  expect_equal(goodmanKruskal(p, q), 1/3)
  expect_equal(goodmanKruskal(q, p), 1/3)
  expect_equal(goodmanKruskal(p, r), -1/3)
  expect_equal(goodmanKruskal(p, s), 1)
  expect_equal(goodmanKruskal(r, s), 1)
})

test_that("the Lerman index works correctly", {
  expect_equal(lermanIndex(p, q), 2*sqrt(21)/21)
  expect_equal(lermanIndex(q, p), 2*sqrt(21)/21)
  expect_equal(lermanIndex(p, r), -sqrt(6)/3)
  expect_equal(lermanIndex(p, s), 3*sqrt(14)/7)
  expect_equal(lermanIndex(r, s), 2)
})

test_that("the normalized Lerman index works correctly", {
  expect_equal(normalizedLermanIndex(random_partition, random_partition), 1)
  
  expect_equal(normalizedLermanIndex(p, q), 1/6)
  expect_equal(normalizedLermanIndex(q, p), 1/6)
  expect_equal(normalizedLermanIndex(p, r), -21**(1/4)/6)
  expect_equal(normalizedLermanIndex(p, s), sqrt(6)/4)
  expect_equal(normalizedLermanIndex(r, s), 21**(1/4)*sqrt(6)/6)
})
