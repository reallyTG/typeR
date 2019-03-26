library(atlantistools)


### Name: change_avail
### Title: Change the availability matrix to simplify automated ATLANTIS
###   calibrations.
### Aliases: change_avail

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
dm <- load_dietmatrix(prm_biol = file.path(d, "VMPA_setas_biol_fishing_Trunk.prm"),
                      fgs = file.path(d, "SETasGroupsDem_NoCep.csv"))

dm1 <- change_avail(dietmatrix = dm,
                    pred = "FPS",
                    pred_stanza = 1,
                    prey = "CEP",
                    roc = 0.1234,
                    relative = FALSE)
# Show only rows with availability of 0.1234
dm1[apply(apply(dm1[, 5:ncol(dm1)], MARGIN = 2, function(x) x == 0.1234), MARGIN = 1, any), ]

dm2 <- change_avail(dietmatrix = dm,
                    pred = c("FPS", "FVS"),
                    pred_stanza = c(1, 2),
                    prey = list(c("FPS", "FVS"), c("FPS", "FVS")),
                    roc = list(c(0.1111, 0.2222), c(0.3333, 0.4444)),
                    relative = FALSE)

# Show only rows with availability of 0.1111, 0.2222, 0.3333 or 0.4444
dm2[apply(apply(dm2[, 5:ncol(dm2)], MARGIN = 2,
function(x) is.element(x,  c(0.1111, 0.2222, 0.3333, 0.4444))), MARGIN = 1, any), ]



