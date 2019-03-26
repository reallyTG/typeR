library(vortexR)
library(vortexRdata)
context("test SSMD_matrix")

test_that("test SSMD_matrix", {

  data(sta.main)
    ssmd_mat <- SSMD_matrix(data=sta.main, project="test",
                            scenario="test",
                            params = c("PExtant", "Nextant"),
                            yrs = c(25, 50), ST = FALSE, save2disk = FALSE)

    pairw<-pairwise(data=sta.main, project='Campbell_et_al', scenario='baseline',
                    params=c("PExtant", "Nextant"), yrs=c(25,50), ST=FALSE,
                    type='Single-Factor',
                    SVs=c('SV1', 'SV2', 'SV3', 'SV4', 'SV5', 'SV6', 'SV7'),
                    save2disk=FALSE)

    expect_length(ssmd_mat, 16)
    expect_equal(pairw$SSMD.table[pairw$SSMD.table$Population=="RWA",
                                "SSMD_Nextant25"],
                 unname(ssmd_mat$`RWA Nextant 25`[2:8,1]))
})
