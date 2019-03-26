library(FishResp)


### Name: calculate.MR
### Title: Calculation of Metabolic Rate
### Aliases: calculate.MR

### ** Examples

# if the data have been already loaded to R,
# skip the first two lines of the code:
data(SMR.slope)
data(AMR.slope)

SMR <- calculate.MR(SMR.slope,
                    density = 1000,
                    plot.BR = TRUE,
                    plot.MR.abs = TRUE,
                    plot.MR.mass = TRUE)

AMR <- calculate.MR(AMR.slope,
                    density = 1000,
                    plot.BR = TRUE,
                    plot.MR.abs = TRUE,
                    plot.MR.mass = TRUE)




