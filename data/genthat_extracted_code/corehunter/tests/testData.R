source("testUtils.R")

#########################
context("Distance data")
#########################

test_that("arguments are checked", {
  expect_error(distances(matrix(0, nrow = 5, ncol = 5), file = "file"), "specify either matrix or file")
  expect_error(distances(), "specify matrix or file")
  expect_error(distances(file = 123), "should be a file path")
  expect_error(distances(file = "i/do/not/exist"), "does not exist")
  expect_error(distances(data = "whoops"), "a matrix or a data frame")
  expect_error(distances(matrix(letters[1:25], nrow = 5, ncol = 5)), "should be numeric")
  expect_error(distances(matrix(0, nrow = 5, ncol = 5)), "names are required")
  m <- matrix(1:25, nrow = 5, ncol = 5)
  rownames(m) <- colnames(m) <- 1:5
  expect_error(distances(m), "matrix should be symmetric")
})

test_that("class", {
  expect_is(distanceData(), "chdist")
  expect_is(distanceData()$data, "matrix")
})

test_that("read distance data from file", {
  # default dataset
  dist <- distanceData()
  expect_equal(dist$file, distanceFile())
  data <- read.autodelim(distanceFile())
  data$NAME <- NULL
  matrix <- as.matrix(data)
  expect_equal(dist$size, 218)
  expect_equal(dist$data, matrix)
  expect_equal(dist$ids, getIds())
  expect_equal(rownames(dist$data), dist$ids)
  expect_equal(colnames(dist$data), dist$ids)
  expect_equal(dist$names, getNames())
  # small dataset
  dist <- distanceData(size = "small")
  expected <- matrix(c(
    0.0, 0.2, 0.4, 0.6, 0.8,
    0.2, 0.0, 0.2, 0.4, 0.6,
    0.4, 0.2, 0.0, 0.1, 0.4,
    0.6, 0.4, 0.1, 0.0, 0.2,
    0.8, 0.6, 0.4, 0.2, 0.0
  ), nrow = 5, ncol = 5)
  rownames(expected) <- colnames(expected) <- getIds(size = "small")
  expect_equal(dist$data, expected)
  expect_equal(dist$size, 5)
  expect_equal(dist$ids, getIds(size = "small"))
  expect_equal(dist$names, getNames(size = "small"))
})

test_that("create distance data from matrix", {
  # 1: default dataset
  data <- read.autodelim(distanceFile())
  matrix <- data
  matrix$NAME <- NULL
  matrix <- as.matrix(matrix)
  # as data frame (with names)
  dist <- distances(data)
  expect_true(is.null(dist$file))
  expect_equal(dist$size, 218)
  expect_equal(dist$data, matrix)
  expect_equal(dist$ids, getIds())
  expect_equal(dist$names, getNames())
  # as numeric matrix (no explicit names)
  dist <- distances(matrix)
  expect_true(is.null(dist$file))
  expect_equal(dist$size, 218)
  expect_equal(dist$data, matrix)
  expect_equal(dist$ids, getIds())
  expect_equal(dist$names, getIds())
  # 2: small dataset
  matrix <- matrix(c(
    0.0, 0.2, 0.4, 0.6, 0.8,
    0.2, 0.0, 0.2, 0.4, 0.6,
    0.4, 0.2, 0.0, 0.1, 0.4,
    0.6, 0.4, 0.1, 0.0, 0.2,
    0.8, 0.6, 0.4, 0.2, 0.0
  ), nrow = 5, ncol = 5)
  rownames(matrix) <- colnames(matrix) <- getIds(size = "small")
  # as numeric matrix (no explicit names)
  dist <- distances(matrix)
  expect_true(is.null(dist$file))
  expect_equal(dist$size, 5)
  expect_equal(dist$data, matrix)
  expect_equal(dist$ids, getIds(size = "small"))
  expect_equal(dist$names, getIds(size = "small"))
  # as data frame (no explicit names)
  dist <- distances(as.data.frame(matrix))
  expect_true(is.null(dist$file))
  expect_equal(dist$size, 5)
  expect_equal(dist$data, matrix)
  expect_equal(dist$ids, getIds(size = "small"))
  expect_equal(dist$names, getIds(size = "small"))
  # as data frame (with names)
  data <- cbind(NAME = c(NA, NA, "Bob", "Bob", NA), as.data.frame(matrix))
  dist <- distances(data)
  expect_true(is.null(dist$file))
  expect_equal(dist$size, 5)
  expect_equal(dist$data, matrix)
  expect_equal(dist$ids, getIds(size = "small"))
  expect_equal(dist$names, getNames(size = "small"))

})

test_that("print", {
  data <- distanceData()
  expect_output(print(data), "# Precomputed distance matrix")
  expect_output(print(data), "accessions = 218")
  expect_output(print(data), "extdata[\\/]*distances.csv")

  data <- distanceData(size = "small")
  expect_output(print(data), "# Precomputed distance matrix")
  expect_output(print(data), "accessions = 5")
  expect_output(print(data), 'Ids: chr \\[1:5\\] "Alice" "Dave" "Bob" "Bob\'" "Carol"')
  expect_output(print(data), 'Names: chr \\[1:5\\] "Alice" "Dave" "Bob" "Bob" "Carol"')
  expect_output(print(data), "testthat[\\/]*data[\\/]*distances-small.txt")
})

########################
context("Genotype data")
########################

test_that("arguments are checked", {
  expect_error(genotypes(), "specify data or file")
  expect_error(genotypes(file = 124, format = "default"), "should be a file path")
  expect_error(genotypes(file = "i/do/not/exist", format = "biparental"), "does not exist")
  expect_error(genotypes(data = testData()$geno$data, file = genotypeFile()), "not both")
  expect_error(genotypes(data = "123", format = "default"), "data frame")
  expect_error(genotypes(data = "abc", format = "biparental"), "matrix or data frame")
  expect_error(genotypes(data = 1:3, format = "frequency"), "matrix or data frame")
  m <- matrix(1:100, 10, 10)
  expect_error(genotypes(data = m, format = "biparental"), "0, 1, 2")
  m <- matrix(sample(c("0","1","2"), replace = TRUE, size = 100), 10, 10)
  expect_error(genotypes(data = m, format = "biparental"), "matrix should be numeric")
  m <- matrix(sample(c(0,1,2), replace = TRUE, size = 100), 10, 10)
  expect_error(genotypes(data = m, format = "biparental"), "row names are required")
  rownames(m) <- letters[1:10]
  expect_silent(genotypes(data = m, format = "biparental"))
  expect_error(genotypes(data = m, format = "freq"), "values between 0.0 and 1.0")
  m <- matrix(runif(100), 10, 10)
  expect_error(genotypes(data = m, format = "freq"), "row names")
  rownames(m) <- letters[1:10]
  expect_error(genotypes(data = m, format = "freq"), "column names")
  colnames(m) <- letters[1:10]
  alleles <- c("x", "y", "z")
  expect_error(genotypes(data = m, alleles, format = "freq"), "number of data columns")
  df <- data.frame(1:10)
  colnames(df) <- NULL
  expect_error(genotypes(df, format = "default"), "column names")
  m <- matrix(sample(c(0,1,2), replace = TRUE, size = 100), 10, 10)
  rownames(m) <- 1:10
  expect_error(genotypes(data = m), "specify data format")
})

test_that("class", {
  expect_is(genotypeData(), "chgeno")
  expect_is(genotypeData()$data, "data.frame")
})

test_that("warned when reading frequency or biparental data as default", {
  expect_warning(genotypes(
    file = genotypeFile(format = "biparental"),
    format = "default"
  ), "'biparental' format, not 'default'")
  expect_warning(genotypes(
    file = genotypeFile(format = "biparental", size = "small"),
    format = "default"
  ), "'biparental' format, not 'default'")
  expect_warning(genotypes(
    file = genotypeFile(format = "frequency"),
    format = "default"
  ), "'frequency' format, not 'default'")
  expect_warning(genotypes(
    file = genotypeFile(format = "frequency", size = "small"),
    format = "default"
  ), "'frequency' format, not 'default'")
})

test_that("read genotype data from file", {
  # 1: default dataset
  for(format in c("default", "biparental", "frequency")){
    geno <- genotypeData(format = format)
    expect_equal(geno$file, genotypeFile(format = format))
    expect_equal(geno$size, 218)
    expect_equal(geno$ids, getIds())
    expect_equal(rownames(geno$data), geno$ids)
    expect_equal(geno$names, getNames())
    expect_equal(geno$markers, getMarkerNames())
    expect_equal(names(geno$alleles), geno$markers)
    expect_equal(length(geno$alleles), geno$java$getNumberOfMarkers())
    for(m in 1:length(geno$alleles)){
      expect_equal(length(geno$alleles[[m]]), geno$java$getNumberOfAlleles(toJavaIndices(m)))
      if(format == "default"){ # homozygous test data
        expected <- unique(geno$data[,m])
        expected <- as.character(expected[!is.na(expected)])
        expect_equal(sort(geno$alleles[[m]]), sort(expected))
      } else if(format == "biparental"){
        expect_equal(geno$alleles[[m]], c("0", "1"))
      } else {
        expect_true(all(is.na(geno$alleles[[m]])))
      }
    }
    if(format == "frequency" || format == "biparental"){
      expect_is(geno$data, "matrix")
      expect_true(is.numeric(geno$data))
    } else {
      expect_is(geno$data, "data.frame")
    }
    expect_equal(geno$format, format)
  }
  # 2: small dataset (default format)
  geno <- genotypeData(size = "small", format = "default")
  expect_equal(geno$size, 5)
  expect_equal(geno$ids, getIds(size = "small"))
  expect_equal(rownames(geno$data), geno$ids)
  expect_equal(geno$names, getNames(size = "small"))
  expect_equal(geno$markers, getMarkerNames(size = "small"))
  expect_equal(names(geno$alleles), geno$markers)
  expect_equal(length(geno$alleles), 4)
  expect_equal(geno$alleles[[1]], c("1", "2", "3"))
  expect_equal(geno$alleles[[2]], c("A", "B", "C", "D"))
  expect_equal(geno$alleles[[3]], c("a1", "a2"))
  expect_equal(geno$alleles[[4]], c("+", "-"))
  expect_equal(geno$format, "default")
  # 3: small dataset (biparental format)
  geno <- genotypeData(size = "small", format = "biparental")
  expect_equal(geno$size, 5)
  expect_equal(geno$ids, getIds(size = "small"))
  expect_equal(rownames(geno$data), geno$ids)
  expect_equal(geno$names, getNames(size = "small"))
  expect_equal(geno$markers, getMarkerNames(size = "small"))
  expect_equal(names(geno$alleles), geno$markers)
  expect_equal(length(geno$alleles), 4)
  for(m in 1:4){
    expect_equal(geno$alleles[[m]], c("0", "1"))
  }
  expect_equal(geno$format, "biparental")
  # 4: small dataset (frequency format)
  geno <- genotypeData(size = "small", format = "frequency")
  expect_equal(geno$size, 5)
  expect_equal(geno$ids, getIds(size = "small"))
  expect_equal(rownames(geno$data), geno$ids)
  expect_equal(geno$names, getNames(size = "small"))
  expect_equal(geno$markers, getMarkerNames(size = "small"))
  expect_equal(names(geno$alleles), geno$markers)
  expect_equal(length(geno$alleles), 4)
  expect_equal(geno$alleles[[1]], c("mk1-1", "mk1-2", "mk1-3"))
  expect_equal(geno$alleles[[2]], c("mk2-1", "mk2-2"))
  expect_equal(geno$alleles[[3]], c(NA, "mk3-2", NA))
  expect_equal(geno$alleles[[4]], c("mk4-1", "mk4-2", "mk4-3", "mk4-4"))
  expect_equal(geno$format, "frequency")
})

test_that("create default genotype data from data frame", {
  ids <- paste("g", 1:5, sep = "-")
  names <- c("Alice", "Bob", "Carol", "Dave", "Eve")
  df <- data.frame(
    NAME = names,
    M1.1 = c(1,2,1,2,1),
    M1.2 = c(3,2,2,3,1),
    M2.1 = c("B","C","D","B",NA),
    M2.2 = c("B","A","D","B",NA),
    M3.1 = c("a1","a1","a2","a2","a1"),
    M3.2 = c("a1","a2","a2","a1","a1"),
    M4.1 = c(NA,"+","+","+","-"),
    M4.2 = c(NA,"-","+","-","-"),
    row.names = ids
  )
  df.no.names <- df
  df.no.names$NAME <- NULL
  markers <- c("M1", "M2", "M3", "M4")
  alleles <- list(
    M1 = as.character(1:3),
    M2 = c("A", "B", "C", "D"),
    M3 = c("a1", "a2"),
    M4 = c("+", "-")
  )
  # without names
  geno <- genotypes(df.no.names, format = "default")
  expect_equal(geno$size,5)
  expect_equal(geno$ids, ids)
  expect_equal(geno$names, ids)
  expect_equal(geno$data, df.no.names)
  expect_equal(geno$markers, markers)
  expect_equal(geno$alleles, alleles)
  expect_equal(geno$format, "default")
  # with names
  geno <- genotypes(df, format = "default")
  expect_equal(geno$size,5)
  expect_equal(geno$ids, ids)
  expect_equal(geno$names, names)
  expect_equal(geno$data, df.no.names)
  expect_equal(geno$markers, markers)
  expect_equal(geno$alleles, alleles)
  expect_equal(geno$format, "default")
  # from data read from file
  geno <- genotypeData(format = "default")
  m <- cbind(NAME = geno$names, geno$data)
  geno <- genotypes(m, format = "default")
  expect_equal(geno$size,218)
  expect_equal(geno$ids, getIds())
  expect_equal(geno$names, getNames())
  expect_equal(geno$data, m[,2:ncol(m)])
  expect_equal(geno$markers, getMarkerNames())
  expect_equal(names(geno$alleles), geno$markers)
  for(marker.alleles in geno$alleles){
    expect_equal(marker.alleles, c("A", "B"))
  }
  expect_equal(geno$format, "default")
})

test_that("create biparental genotype data from matrix or data frame", {
  # from matrix with ids and marker names
  m <- matrix(
    sample(c(0,1,2), replace = TRUE, size = 1000),
    nrow = 10, ncol = 100
  )
  ids <- paste("g", 1:10, sep = "-")
  markers <- paste("m", 1:100, sep = "-")
  rownames(m) <- ids
  colnames(m) <- markers
  geno <- genotypes(m, format = "biparental")
  expect_equal(geno$size, 10)
  expect_equal(geno$ids, ids)
  expect_equal(geno$names, ids)
  expect_equal(geno$data, m)
  expect_equal(geno$markers, markers)
  expect_equal(names(geno$alleles), geno$markers)
  lapply(geno$alleles, function(markerAlleles){
    expect_equal(markerAlleles, c("0", "1"))
  })
  expect_equal(geno$format, "biparental")
  # with ids, no marker names
  m2 <- m
  colnames(m2) <- NULL
  geno <- genotypes(m2, format = "biparental")
  expect_equal(geno$data, m2)
  expect_equal(geno$markers, as.character(rep(NA, ncol(m2))))
  expect_null(names(geno$alleles))
  # from data frame with ids, names and marker names
  names <- letters[1:10]
  df <- data.frame(NAME = names, m, check.names = F)
  geno <- genotypes(df, format = "biparental")
  expect_equal(geno$size, 10)
  expect_equal(geno$ids, ids)
  expect_equal(geno$names, names)
  expect_equal(geno$data, m)
  expect_equal(geno$markers, markers)
  expect_equal(names(geno$alleles), geno$markers)
  lapply(geno$alleles, function(markerAlleles){
    expect_equal(markerAlleles, c("0", "1"))
  })
  expect_equal(geno$format, "biparental")
  # from data frame without names
  df <- data.frame(m, check.names = F)
  geno <- genotypes(df, format = "biparental")
  expect_equal(geno$names, ids)
  expect_equal(geno$data, m)
  expect_equal(geno$format, "biparental")
  # from data frame without names or marker names
  df <- data.frame(m, check.names = F)
  colnames(df) <- NULL
  geno <- genotypes(df, format = "biparental")
  expect_equal(geno$data, m2)
  expect_equal(geno$names, ids)
  expect_true(all(is.na(geno$markers)))
  expect_null(names(geno$alleles))
  expect_equal(geno$format, "biparental")
  # from data frame with names, no marker names
  df <- data.frame(NAME = names, m, check.names = F)
  colnames(df)[2:ncol(df)] <- NA
  geno <- genotypes(df, format = "biparental")
  expect_equal(geno$data, m2)
  expect_equal(geno$names, names)
  expect_true(all(is.na(geno$markers)))
  expect_null(names(geno$alleles))
  expect_equal(geno$format, "biparental")
  # from data read from file
  m <- genotypeData(format = "bi")$data
  geno <- genotypes(m, format = "bi")
  expect_equal(geno$data, m)
  expect_equal(geno$ids, getIds())
  expect_equal(geno$names, getIds())
  expect_equal(geno$markers, getMarkerNames())
  expect_equal(names(geno$alleles), geno$markers)
  for(marker.alleles in geno$alleles){
    expect_equal(marker.alleles, c("0", "1"))
  }
  expect_equal(geno$format, "biparental")
})

test_that("create frequency data from matrix or data frame", {
  # from matrix
  m <- matrix(
   c(0.0, 0.3, 0.7, 0.5, 0.5, 0.0, 1.0,
     0.4, 0.0, 0.6, 0.1, 0.9, 0.0, 1.0,
     0.3, 0.3, 0.4, 1.0, 0.0, 0.6, 0.4),
   byrow = TRUE, nrow = 3, ncol = 7
  )
  ids <- paste("g", 1:3, sep = "-")
  columns <- c("M1.1", "M1.2", "M1.3", "M2-a", "M2-b", "M3_1", "M3_2")
  alleles <- c("M1-a", "M1-b", "M1-c", "M2-a", "M2-b", "M3-a", "M3-b")
  rownames(m) <- ids
  colnames(m) <- columns
  geno <- genotypes(m, alleles, format = "frequency")
  expect_equal(geno$size, 3)
  expect_equal(geno$ids, ids)
  expect_equal(geno$names, ids)
  expect_equal(geno$data, m)
  expect_equal(geno$markers, c("M1", "M2", "M3"))
  expect_equal(names(geno$alleles), geno$markers)
  expect_equal(geno$alleles$M1, alleles[1:3])
  expect_equal(geno$alleles$M2, alleles[4:5])
  expect_equal(geno$alleles$M3, alleles[6:7])
  expect_equal(geno$format, "frequency")
  # from data frame without names
  df <- data.frame(m, check.names = FALSE)
  geno <- genotypes(df, alleles, format = "freq")
  expect_equal(geno$data, m)
  expect_equal(geno$format, "frequency")
  # from data frame with names
  names <- letters[1:3]
  df <- data.frame(NAME = names, m, check.names = FALSE)
  geno <- genotypes(df, alleles, format = "freq")
  expect_equal(geno$data, m)
  expect_equal(geno$ids, ids)
  expect_equal(geno$names, names)
  expect_equal(geno$format, "frequency")
  # from matrix without allele names
  geno <- genotypes(m, format = "freq")
  expect_equal(geno$data, m)
  expect_equal(names(geno$alleles), geno$markers)
  expect_equal(geno$alleles$M1, as.character(rep(NA, 3)))
  expect_equal(geno$alleles$M2, as.character(rep(NA, 2)))
  expect_equal(geno$alleles$M3, as.character(rep(NA, 2)))
  expect_equal(geno$format, "frequency")
  # from data read from file
  m <- genotypeData(format = "freq")$data
  geno <- genotypes(m, format = "freq")
  expect_equal(geno$data, m)
  expect_equal(geno$ids, getIds())
  expect_equal(geno$names, getIds())
  expect_equal(geno$markers, getMarkerNames())
  expect_equal(names(geno$alleles), geno$markers)
  for(marker.alleles in geno$alleles){
    expect_equal(marker.alleles, as.character(rep(NA, 2)))
  }
  expect_equal(geno$format, "frequency")
})

test_that("print", {
  data <- genotypeData(format = "default")
  expect_output(print(data), "# Genotypes")
  expect_output(print(data), "accessions = 218")
  expect_output(print(data), "markers = 190")
  expect_output(print(data), "alleles per marker = 2")
  expect_output(print(data), "Format = default")
  expect_output(print(data), "extdata[\\/]*genotypes.csv")

  data <- genotypeData(format = "biparental")
  expect_output(print(data), "# Genotypes")
  expect_output(print(data), "accessions = 218")
  expect_output(print(data), "markers = 190")
  expect_output(print(data), "alleles per marker = 2")
  expect_output(print(data), "Format = biparental")
  expect_output(print(data), "extdata[\\/]*genotypes-biparental.csv")

  data <- genotypeData(format = "freq")
  expect_output(print(data), "# Genotypes")
  expect_output(print(data), "accessions = 218")
  expect_output(print(data), "markers = 190")
  expect_output(print(data), "alleles per marker = 2")
  expect_output(print(data), "Format = frequency")
  expect_output(print(data), "extdata[\\/]*genotypes-frequency.csv")

  data <- genotypeData(format = "default", size = "small")
  expect_output(print(data), "# Genotypes")
  expect_output(print(data), "accessions = 5")
  expect_output(print(data), 'Ids: chr \\[1:5\\] "Alice" "Dave" "Bob" "Bob\'" "Carol"')
  expect_output(print(data), 'Names: chr \\[1:5\\] "Alice" "Dave" "Bob" "Bob" "Carol"')
  expect_output(print(data), "markers = 4")
  expect_output(print(data), 'Marker names: chr \\[1:4\\] "mk1" "mk,2" "mk\'3" "mk4"')
  expect_output(print(data), "alleles per marker = 2-4")
  expect_output(print(data), "Format = default")
  expect_output(print(data), "testthat[\\/]*data[\\/]*genotypes-small.csv")

  data <- genotypeData(format = "biparental", size = "small")
  expect_output(print(data), "# Genotypes")
  expect_output(print(data), "accessions = 5")
  expect_output(print(data), 'Ids: chr \\[1:5\\] "Alice" "Dave" "Bob" "Bob\'" "Carol"')
  expect_output(print(data), 'Names: chr \\[1:5\\] "Alice" "Dave" "Bob" "Bob" "Carol"')
  expect_output(print(data), "markers = 4")
  expect_output(print(data), 'Marker names: chr \\[1:4\\] "mk1" "mk,2" "mk\'3" "mk4"')
  expect_output(print(data), "alleles per marker = 2")
  expect_output(print(data), "Format = biparental")
  expect_output(print(data), "testthat[\\/]*data[\\/]*genotypes-bi-small.csv")

  data <- genotypeData(format = "freq", size = "small")
  expect_output(print(data), "# Genotypes")
  expect_output(print(data), "accessions = 5")
  expect_output(print(data), 'Ids: chr \\[1:5\\] "Alice" "Dave" "Bob" "Bob\'" "Carol"')
  expect_output(print(data), 'Names: chr \\[1:5\\] "Alice" "Dave" "Bob" "Bob" "Carol"')
  expect_output(print(data), "markers = 4")
  expect_output(print(data), 'Marker names: chr \\[1:4\\] "mk1" "mk,2" "mk\'3" "mk4"')
  expect_output(print(data), "alleles per marker = 2-4")
  expect_output(print(data), "Format = frequency")
  expect_output(print(data), "testthat[\\/]*data[\\/]*genotypes-freq-small.csv")
})

#########################
context("Phenotype data")
#########################

test_that("arguments are checked", {
  expect_error(phenotypes(), "path is required")
  expect_error(phenotypes(file = 124), "should be a file path")
  expect_error(phenotypes(file = "i/do/not/exist"), "does not exist")
  expect_error(phenotypes(data = data.frame(), file = phenotypeFile()), "either data frame or file")
  expect_error(phenotypes(file = "data/phenotypes-no-types.csv"), "types are required")
  expect_error(phenotypes(data = 456), "should be a data frame")
  # no column ids
  df <- data.frame(1:10, letters[1:10])
  colnames(df) <- NULL
  expect_error(phenotypes(data = df), "names are required")
  # invalid type
  df <- data.frame(1:10, letters[1:10])
  expect_error(phenotypes(df, types = c("I", "N", "R")), "does not correspond to number of data columns")
  expect_error(phenotypes(df, types = c("I", "NSS")), "one or two characters")
  expect_error(phenotypes(df, types = c("X", "Y")), "unknown scale", ignore.case = TRUE)
  expect_error(phenotypes(file = "data/phenotypes-unknown-type.csv"), "unsupported variable type", ignore.case = TRUE)
  # no auto type
  df <- data.frame(rep(as.Date("2016-06-27"), 10), letters[1:10])
  expect_error(phenotypes(df), "infer variable type")
  # invalid ranges
  df <- data.frame(1:10, letters[1:10])
  expect_error(phenotypes(df, min = c("a", NA)), "should be numeric")
  expect_error(phenotypes(df, max = c(F, NA)), "should be numeric")
  expect_error(phenotypes(df, min = c(1, NA, 10)), "number of data columns")
  expect_error(phenotypes(df, max = c(5, NA, 100)), "number of data columns")
})

test_that("class", {
  expect_is(phenotypeData(), "chpheno")
  expect_is(phenotypeData()$data, "data.frame")
})

test_that("read phenotype data from file", {
  # 1: default dataset
  pheno <- phenotypeData()
  expect_equal(pheno$file, phenotypeFile())
  expect_equal(pheno$size, 218)
  expect_equal(pheno$ids, getIds())
  expect_equal(rownames(pheno$data), pheno$ids)
  expect_equal(pheno$names, getNames())
  expect_equal(pheno$ranges, getRanges())
  # check average Gower distance of all individuals without missing data
  # (Core Hunter treats missing data slightly differently compared to StatMatch)
  no.missing.data <- which(!apply(is.na(pheno$data), 1, any))
  gd <- StatMatch::gower.dist(pheno$data[no.missing.data, ], rngs = pheno$ranges)
  gd <- gd[lower.tri(gd)]
  expect_equal(mean(gd), evaluateCore(no.missing.data, pheno, objective("EE", "GD")))
  # 2: small dataset
  pheno <- phenotypeData(size = "small")
  expect_equal(pheno$size, 5)
  expect_equal(pheno$ids, getIds(size = "small"))
  expect_equal(rownames(pheno$data), pheno$ids)
  expect_equal(pheno$names, getNames(size = "small"))
  expect_equal(pheno$ranges, getRanges(size = "small"))
  for(r in 1:pheno$size){
    # extract row from Java object
    row <- pheno$java$getRow(as.integer(r-1))
    # compare values
    for(trait in 1:ncol(pheno$data)){
      R.value <- pheno$data[[trait]][r]
      Java.value <- row$getValue(as.integer(trait-1))
      expect_equal(as.character(Java.value), as.character(R.value))
    }
  }
  # check average Gower distance (no missing data in small dataset)
  gd <- StatMatch::gower.dist(pheno$data, rngs = pheno$ranges)
  gd <- gd[lower.tri(gd)]
  expect_equal(mean(gd), evaluateCore(1:5, pheno, objective("EE", "GD")))
})

test_that("phenotype file with single trait", {
  pheno.file <- "data/phenotypes-single.csv"
  pheno <- phenotypes(file = pheno.file)
  expect_equal(pheno$file, normalizePath(pheno.file))
  expect_equal(pheno$size, 10)
  expect_equal(pheno$ids, as.character(1:10))
  expect_equal(rownames(pheno$data), pheno$ids)
  expect_equal(pheno$names, c("ABBUOTO", "ABRUSCO", "AGLIANICO", "ALBANA", "ALBANELLO", "ALBAROSSA",
                              "UVA_MELONA", "ALBARANZEULI_BIANCO", "ALEATICO", "ALICANTE_BOUSCHET"))
  expect_equal(pheno$ranges, 17.5)
})

test_that("create phenotype data from data frame", {

  # three different ways to compute Gower distance matrix
  gd <- function(df){
    pheno <- phenotypes(df)
    StatMatch::gower.dist(df, rngs = pheno$ranges, KR.corr = FALSE)
  }
  gd2 <- function(df){
    pheno <- phenotypes(df)
    StatMatch::gower.dist(pheno$data, rngs = pheno$ranges, KR.corr = FALSE)
  }
  gd3 <- function(df){
    pheno <- phenotypes(df)
    m <- matrix(0.0, pheno$size, pheno$size)
    for(i in 1:pheno$size){
      if(i < pheno$size){
        for(j in (i+1):pheno$size){
          m[i,j] <- m[j,i] <- evaluateCore(c(i,j), pheno, objective("EE", "GD"))
        }
      }
    }
    return(m)
  }

  # create data frame
  df <- data.frame(
    n = sample(letters[1:10], size = 5, replace = TRUE),
    i = sample(1:10, size = 5, replace = TRUE),
    o = ordered(sample(letters[1:10], size = 5, replace = TRUE), levels = letters[1:10]),
    r = rnorm(5),
    b = sample(c(T,F), size = 5, replace = TRUE)
  )
  # create phenotype data with automatic types and ranges
  pheno <- phenotypes(df)
  expect_equal(pheno$size, 5)
  expect_equal(pheno$ids, as.character(1:5))
  expect_equal(pheno$names, as.character(1:5))
  expect_equal(pheno$data$o, as.integer(df$o))
  expect_equal(pheno$types, c("N", "I", "I", "R", "NB"))
  expect_equal(pheno$ranges, c(NA, max(df$i) - min(df$i), 9, max(df$r) - min(df$r), NA))
  expect_equal(gd(df), gd2(df))
  expect_equal(gd(df), gd3(df))

  # same but with first column as character instead of factor
  df$n <- as.character(df$n)
  pheno.factor <- pheno
  pheno.character <- phenotypes(df)
  expect_equal(pheno.character, pheno.factor)

  # explicit types (all nominal string)
  pheno <- phenotypes(df, types = rep("NS", 5))
  for(c in 1:ncol(df)){
    expect_is(pheno$data[[c]], "factor")
  }
  expect_equal(pheno$types, rep("NS", 5))
  expect_equal(pheno$ranges, as.numeric(rep(NA, 5)))
  expect_equal(gd(df), gd2(df))
  expect_equal(gd(df), gd3(df))

  # with dates
  df.dates <- df
  df.dates$dates <- format(as.Date(c(
    "2016-06-01",
    "2016-06-05",
    "2016-06-02",
    "2016-06-03",
    "2016-06-04"
  )), format = "%Y%m%d%H%M%S%z")
  pheno <- phenotypes(df.dates, types = c(rep(NA, 5), "OA"))
  expect_equal(pheno$types[6], "OA")
  expect_equal(gd(df), gd2(df))
  expect_equal(gd(df), gd3(df))

  # with names
  df <- cbind(NAME = letters[1:5], df, stringsAsFactors = FALSE)
  pheno <- phenotypes(df)
  expect_equal(pheno$names, letters[1:5])

  # single trait
  df <- df[, "r", drop = FALSE]
  pheno <- phenotypes(df)
  expect_equal(pheno$size, 5)
  expect_equal(pheno$ids, as.character(1:5))
  expect_equal(pheno$names, as.character(1:5))
  expect_equal(pheno$types, "R")
  expect_equal(pheno$ranges, max(df$r) - min(df$r))

})

test_that("print", {
  data <- phenotypeData()
  expect_output(print(data), "# Phenotypes")
  expect_output(print(data), "accessions = 218")
  expect_output(print(data), "traits = 4")
  expect_output(print(data), 'Traits: "GY" "PHT" "EHT" "AD"')
  expect_output(print(data), 'Quantitative traits: "GY" "PHT" "EHT" "AD"')
  expect_output(print(data), 'Qualitative traits: n/a')
  expect_output(print(data), "extdata[\\/]*phenotypes.csv")

  data <- phenotypeData(size = "small")
  expect_output(print(data), "# Phenotypes")
  expect_output(print(data), "accessions = 5")
  expect_output(print(data), "traits = 5")
  expect_output(print(data), 'Traits: "trait 1" "trait 2" "trait 3" "trait 4" "trait 5"')
  expect_output(print(data), 'Quantitative traits: "trait 2" "trait 3" "trait 4"')
  expect_output(print(data), 'Qualitative traits: "trait 1" "trait 5"')
  expect_output(print(data), "testthat[\\/]*data[\\/]*phenotypes-small.csv")
})

###########################
context("Core Hunter data")
###########################

test_that("arguments are checked", {
  expect_error(coreHunterData(), "specify at least one")
  expect_error(coreHunterData(distances = list(1, "a")), "class 'chdist'")
  expect_error(coreHunterData("x"), "class 'chgeno'")
  expect_error(coreHunterData(phenotypes = 123), "class 'chpheno'")
  expect_error(coreHunterData(distances = "123"), "class 'chdist'")
})

test_that("class", {
  expect_is(testData(), "chdata")
  expect_is(testData()$dist, "chdist")
  expect_is(testData()$geno, "chgeno")
  expect_is(testData()$pheno, "chpheno")
})

test_that("distance matrix", {
  data <- read.autodelim(distanceFile())
  data$NAME <- NULL
  matrix <- as.matrix(data)
  expect_equal(testData()$dist$data, matrix)
})

test_that("size", {
  expect_equal(testData()$size, 218)
})

test_that("example data", {
  data <- exampleData()
  expect_equal(data$dist, distanceData())
  expect_equal(data$geno, genotypeData(format = "biparental"))
  expect_equal(data$pheno, phenotypeData())
})

test_that("print", {
  data <- testData()
  expect_output(print(data), "Core Hunter data")
  expect_output(print(data), "accessions = 218")
  expect_output(print(data), "# Genotypes")
  expect_output(print(data), "# Phenotypes")
  expect_output(print(data), "# Precomputed distance matrix")
})





