library(FloodMapper)


### Name: FM.rerun
### Title: Rerun An Existing Model
### Aliases: FM.rerun

### ** Examples

## Load FloodMapper package
library(FloodMapper)

s_return <- NA

## Assume that the model run with a name of "Lafayette_1km" has been completed successfully,
## now you want to rerun this model after adjust some parameter files (under the input folder),
## you can run the following command to rerun the model.
## No test: 
    s_return <- FM.rerun(runname = "Lafayette_1km",
        startdatetime = "2016-08-12 10:00:00", 
        enddatetime = "2016-08-12 11:00:00", outputinterval = 3600, 
        internaltimestep = 300, wdbreakpoints = seq(0, 3000, 150),
        workdir = tempdir(), animation = TRUE, bgtype = 0,
        aerialraster = "", pdfoutput = FALSE)
## End(No test)

## Check if there are any errors
if (!is.na(s_return)) {
    if (s_return != "") {
        cat("Model rerun is failed because of the following error:\n")
        cat(s_return)
    } else {
        cat("Model rerun is successful!\n")
    }
}



