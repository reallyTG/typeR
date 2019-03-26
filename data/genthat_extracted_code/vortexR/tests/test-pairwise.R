library(vortexR)
library(vortexRdata)
context("test pairwise")

test_that("test pairwise", {

  data(pac.clas, pac.clas.pairw)
  pairw<-pairwise(data=pac.clas, project="Pacioni_et_al", scenario="ST_Classic",
                  params=c("Nall", "Het"), yrs=c(60,120), ST=T,
                  type="Single-Factor",
                  SVs=c("SV1", "SV2", "SV3", "SV4", "SV5", "SV6", "SV7"),
                  save2disk=FALSE)

  expect_equal(pac.clas.pairw, pairw)
})
