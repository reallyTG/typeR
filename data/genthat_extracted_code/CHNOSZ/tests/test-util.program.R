context("util.program")

# these tests are inefficient uses of parallelization
# (overhead is greater than the savings from multiple cores)
# just here to test that the functions are working

test_that("palply() launches calculations on multiple cores", {
  if(min(getOption("mc.cores"), 2) > 1 & parallel::detectCores() > 1) {
    x <- 1:1001
    # for this we don't have to export any variables so varlist=""
    expect_message(palply("", 1:length(x), function(i) i^2), "running 1001 calculations")
  }
})

test_that("other functions are calling palply() properly", {
  if(min(getOption("mc.cores"), 2) > 1 & parallel::detectCores() > 1) {
    # CHNOSZ no longer has a large FASTA file to test this with 20170205
    #ff <- system.file("extdata/fasta/HTCC1062.faa.xz", package="CHNOSZ")
    #expect_message(aa <- read.fasta(ff), "read.fasta running 1354 calculations")
    basis("CHNOS")
    ip <- 1:nrow(thermo()$protein)
    expect_message(a <- affinity(iprotein=rep(ip, 3)), "affinity running .* calculations")
    expect_message(e <- equilibrate(a, normalize=TRUE), "equil.boltzmann running .* calculations")
    # test reaction method
    species(c("CO2", "acetic acid"))
    a <- affinity(O2=c(-90, -60, 1000))
    expect_message(e <- equilibrate(a), "equil.reaction running 1000 calculations")
  }
})
