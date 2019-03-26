library(FishResp)


### Name: export.MR
### Title: Export Metabolic Rate
### Aliases: export.MR

### ** Examples

# if the data have been already loaded to R,
# skip the first two lines of the code:
data(SMR)
data(AMR)

results <- export.MR(SMR, AMR,
                     file = "results.txt",
                     simplify = TRUE,
                     MS = TRUE,
                     plot.MS.abs = TRUE,
                     plot.MS.mass = TRUE,
                     plot.MS.fact = TRUE)




