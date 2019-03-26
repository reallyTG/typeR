library(FishResp)


### Name: convert.rMR
### Title: Convert Raw Respirometry Data (rMR)
### Aliases: convert.rMR

### ** Examples

# Import raw data for active metabolic rate
AMR.path = system.file("extdata/stickleback/AMR_raw.txt.xz", package = "FishResp")

convert.rMR(import.file = AMR.path,
            export.file = "converted_AMR_raw.txt",
            n.chamber = 2, logger = "AutoResp", salinity = 0,
            DO.units.in = "mg/L", DO.units.out = "PP",
            bar.press = 101.325, bar.units.in = "kpa")




