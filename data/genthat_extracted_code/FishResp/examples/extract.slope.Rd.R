library(FishResp)


### Name: extract.slope
### Title: Extraction of Slope(s)
### Aliases: extract.slope

### ** Examples

# if the data have been already loaded to R,
# skip the first two lines of the code:
data(SMR.clean)
data(AMR.clean)

SMR.slope <- extract.slope(SMR.clean,
                           method = "min",
                           n.slope = 3,
                           r2=0.95,
                           length = 1200)

AMR.slope <- extract.slope(AMR.clean,
                           method = "all",
                           r2=0.95,
                           length = 300)




