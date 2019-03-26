library(vortexR)
library(vortexRdata)
context("test lookup")

test_that("test lookup", {

data(pac.clas.lookup)
lkup.st.classic <- lookup_table(data=pac.clas, project="Pacioni_et_al",
                        scenario="ST_Classic", pop="Population 1",
                        SVs=c("SV1", "SV2", "SV3", "SV4", "SV5", "SV6", "SV7"),
                        save2disk=FALSE)

expect_equal(pac.clas.lookup, lkup.st.classic)
})
