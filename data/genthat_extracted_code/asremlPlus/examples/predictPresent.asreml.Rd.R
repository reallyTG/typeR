library(asremlPlus)


### Name: predictPresent.asreml
### Title: Forms the predictions for each of one or more terms and presents
###   them in tables and/or graphs.
### Aliases: predictPresent.asreml predictPresent
### Keywords: asreml

### ** Examples
## Not run: 
##D data(WaterRunoff.dat)
##D titles <- list("Days since first observation", "Days since first observation", 
##D                "pH", "Turbidity (NTU)")
##D names(titles) <- names(WaterRunoff.dat)[c(5,7,11:12)]
##D asreml.options(keep.order = TRUE) #required for asreml-R4 only
##D current.asr <- asreml(fixed = log.Turbidity ~ Benches + Sources + Type + Species + 
##D                                  Sources:Type + Sources:Species + Sources:Species:xDay + 
##D                                  Sources:Species:Date, 
##D                       data = WaterRunoff.dat, keep.order = TRUE)
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D 
##D #### Get the observed combinations of the factors and variables in classify
##D class.facs <- c("Sources","Species","Date","xDay")
##D levs <- as.data.frame(table(WaterRunoff.dat[class.facs]))
##D levs <- levs[do.call(order, levs), ]
##D levs <- as.list(levs[levs$Freq != 0, class.facs])
##D levs$xDay <- as.numfac(levs$xDay)
##D   
##D #### parallel and levels are arguments from predict.asreml
##D diff.list <- predictPresent.asreml(asreml.obj = current.asrt$asreml.obj, 
##D                                    terms = "Date:Sources:Species:xDay",
##D                                    x.num = "xDay", x.fac = "Date", 
##D                                    parallel = TRUE, levels = levs, 
##D                                    wald.tab = current.asrt$wald.tab, 
##D                                    plots = "predictions", 
##D                                    error.intervals = "StandardError", 
##D                                    titles = titles, 
##D                                    transform.power = 0, 
##D                                    present = c("Type","Species","Sources"), 
##D                                    tables = "none", 
##D                                    level.length = 6)
## End(Not run)


