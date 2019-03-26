library(FishResp)


### Name: rm.data
### Title: Remove Poor Quality Data
### Aliases: rm.data

### ** Examples

# if the data have been already loaded to R,
# skip the first line of the code:
data(AMR.clean)
AMR.clean.modified <- rm.data(AMR.clean,
                              chamber = "CH3",
                              M.phase = c("M1","M2"))




