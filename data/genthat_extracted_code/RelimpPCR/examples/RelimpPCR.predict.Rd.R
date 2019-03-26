library(RelimpPCR)


### Name: RelimpPCR.predict
### Title: Predictor Function for RelimpPCR
### Aliases: RelimpPCR.predict

### ** Examples

## No test: 
#The below function takes a trained PCR object (produced by RelimpPCR) 
#and a dataframe (using the same columns that the PCR object was trained 
#with) and produces a prediction.
y = mtcars$mpg[1:20]; x = mtcars[1:20,c("cyl","disp")]
pcr_object = RelimpPCR(Y = y, X = x,target_r2 = 0.75, multicore = FALSE,
                       remove_factors = FALSE, normalize_data = FALSE, plot_this = FALSE)
pred = RelimpPCR.predict(pcr_object, data.frame(mtcars$cyl, mtcars$disp))
## End(No test)



