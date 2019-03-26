library(MplusAutomation)


### Name: plotGrowthMixtures
### Title: Plot growth mixture models
### Aliases: plotGrowthMixtures
### Keywords: internal

### ** Examples

## Not run: 
##D mydat <- read.table("http://statmodel.com/usersguide/chap8/ex8.2.dat", header = FALSE)[,-6]
##D createMixtures(classes = 1:3, filename_stem = "ex8.2",
##D                model_overall = "i s | V1@0 V2@1 V3@2 V4@3;  i s on V5;",
##D                rdata = mydat,
##D                OUTPUT = "tech11 tech14;", usevariables = c("V1", "V2", "V3",
##D                                                            "V4", "V5"))
##D runModels(replaceOutfile = "modifiedDate")
##D mplus_output <- readModels(filefilter = "ex8.2")
##D plotGrowthMixtures(mplus_output, estimated = TRUE, rawdata = TRUE, time_scale = c(0, 1, 2, 3))
##D plotGrowthMixtures(mplus_output, estimated = FALSE, rawdata = TRUE,
##D                   poly = TRUE)
##D 
##D createMixtures(classes = 1:3, filename_stem = "ex8.2_free",
##D                model_overall = "i s | V1@0 V2* V3* V4@3;  i s on V5;",
##D                rdata = mydat,
##D                OUTPUT = "tech11 tech14;", usevariables = c("V1", "V2", "V3",
##D                                                            "V4", "V5"))
##D runModels(replaceOutfile = "modifiedDate")
##D mplus_output_free <- readModels(filefilter = "ex8.2_free")
##D plotMixtureDensities(mplus_output_free, variables = c("V1", "V2", "V3",
##D                                                       "V4"))
##D plotGrowthMixtures(mplus_output_free, estimated = TRUE, rawdata = TRUE,
##D                   bw = TRUE, time_scale = c(0, 1, 2, 3),
##D                   alpha_range = c(0, .05))
##D 
##D plotGrowthMixtures(mplus_output, estimated = FALSE, rawdata = TRUE,
##D                   poly = TRUE, bw = TRUE, time_scale = c(0, 1, 2, 3))
## End(Not run)



