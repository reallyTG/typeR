context("add.protein")

# clear out any prior database alterations
suppressMessages(reset())

test_that("add.protein works as expected", {
  # factors causing problems again ...
  f <- system.file("extdata/protein/DS11.csv", package="CHNOSZ")
  aa <- read.csv(f)
  # this adds the proteins
  ip <- add.protein(aa)
  # the replaces the proteins (with the same ones)
  expect_error(ip <- add.protein(aa), "converting factors causes problems replacing protein data")
  # ... should use read.csv(file, as.is=TRUE)
})

test_that("errors and messages occur in some circumstances", {
  expect_error(seq2aa("LYS_CHICK", "XXX"), "no characters match an amino acid")
  expect_error(add.protein(count.aa("AAA")), "does not have the same columns as thermo\\$protein")
  expect_message(add.protein(pinfo(pinfo("CYC_BOVIN"))), "replaced 1 existing protein\\(s\\)")
})

test_that("group additivity for proteins gives expected values", {
  # values for chicken lysozyme calculated using group additivity values
  # from Dick et al., 2006 [DLH06] (Biogeosciences 3, 311-336)
  G <- -4206050
  Cp <- 6415.5
  V <- 10421
  formula <- "C613H959N193O185S10"
  # to reproduce, use superseded properties of [Met], [Gly], and [UPBB] (Dick et al., 2006)
  add.obigt("OldAA")
  lprop <- info(info("LYSC_CHICK"))
  expect_equal(G, lprop$G)
  expect_equal(Cp, lprop$Cp, tolerance=1e-5)
  expect_equal(V, lprop$V, tolerance=1e-4)
  expect_equal(formula, lprop$formula)
})

test_that("read.fasta() identifies sequences correctly and gives amino acid compositions in the correct format",{
  ffile <- system.file("extdata/fasta/EF-Tu.aln", package="CHNOSZ")
  aa <- read.fasta(ffile)
  expect_equal(aa[1, ], read.fasta(ffile, 1))
  # use unlist here so that different row names are not compared
  expect_equal(unlist(aa[8, ]), unlist(read.fasta(ffile, 8)))
  expect_message(ip1 <- add.protein(aa), "added 8 new protein\\(s\\)")
  expect_message(ip2 <- add.protein(aa), "replaced 8 existing protein\\(s\\)")
  # add.protein should return the correct indices for existing proteins
  expect_equal(ip1, ip2)
})

# for the future... make info() faster!
# (especially the loading of ionizable groups for proteins)
#test_that("calculations for ionized proteins meet performance expectations", {
#  expect_that({
#    basis("CHNOS+")
#    i <- info(c("LYSC_CHICK","RNAS1_BOVIN"))
#    species(i)
#    a <- affinity()
#  }, takes_less_than(0.4))
#})
