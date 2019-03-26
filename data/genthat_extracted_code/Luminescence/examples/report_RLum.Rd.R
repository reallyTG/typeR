library(Luminescence)


### Name: report_RLum
### Title: Create a HTML report for (RLum) objects
### Aliases: report_RLum

### ** Examples


## Not run: 
##D ## Example: RLum.Results ----
##D 
##D # load example data
##D data("ExampleData.DeValues")
##D 
##D # apply the MAM-3 age model and save results
##D mam <- calc_MinDose(ExampleData.DeValues$CA1, sigmab = 0.2)
##D 
##D # create the HTML report
##D report_RLum(object = mam, file = "~/CA1_MAM.Rmd",
##D             timestamp = FALSE,
##D             title = "MAM-3 for sample CA1")
##D 
##D # when creating a report the input file is automatically saved to a
##D # .Rds file (see saveRDS()).
##D mam_report <- readRDS("~/CA1_MAM.Rds")
##D all.equal(mam, mam_report)
##D 
##D 
##D ## Example: Temporary file & Viewer/Browser ----
##D 
##D # (a)
##D # Specifying a filename is not necessarily required. If no filename is provided,
##D # the report is rendered in a temporary file. If you use the RStudio IDE, the
##D # temporary report is shown in the interactive Viewer pane.
##D report_RLum(object = mam)
##D 
##D # (b)
##D # Additionally, you can view the HTML report in your system's default web browser.
##D report_RLum(object = mam, launch.browser = TRUE)
##D 
##D 
##D ## Example: RLum.Analysis ----
##D 
##D data("ExampleData.RLum.Analysis")
##D 
##D # create the HTML report (note that specifying a file
##D # extension is not necessary)
##D report_RLum(object = IRSAR.RF.Data, file = "~/IRSAR_RF")
##D 
##D 
##D ## Example: RLum.Data.Curve ----
##D 
##D data.curve <- get_RLum(IRSAR.RF.Data)[[1]]
##D 
##D # create the HTML report
##D report_RLum(object = data.curve, file = "~/Data_Curve")
##D 
##D ## Example: Any other object ----
##D x <- list(x = 1:10,
##D           y = runif(10, -5, 5),
##D           z = data.frame(a = LETTERS[1:20], b = dnorm(0:9)),
##D           NA)
##D 
##D report_RLum(object = x, file = "~/arbitray_list")
## End(Not run)




