library(FishResp)


### Name: QC.slope
### Title: Quality Control of Slope(s)
### Aliases: QC.slope

### ** Examples

# if the data have been already loaded to R,
# skip the first four lines of the code:
data(SMR.clean)
data(SMR.slope)
data(AMR.clean)
data(AMR.slope)

QC.slope(SMR.slope, SMR.clean, chamber = "CH1",
         current = 1200, alter = 600)

QC.slope(AMR.slope, AMR.clean, chamber = "CH4",
         current = 600, alter = 300, residuals = TRUE)




