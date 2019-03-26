library(FishResp)


### Name: convert.respirometry
### Title: Convert Raw Respirometry Data (respirometry)
### Aliases: convert.respirometry

### ** Examples

# Import raw data for standard metabolic rate
SMR.path = system.file("extdata/stickleback/SMR_raw.txt.xz", package = "FishResp")

convert.respirometry(import.file = SMR.path,
                     export.file = "converted_SMR_raw.txt",
                     n.chamber = 1, logger = "AutoResp",
                     from = "mg_per_l", to = "mmol_per_l",
                     sal = 0, atm_pres = 1013.25)




