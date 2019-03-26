library(imageData)


### Name: imageData-pkg
### Title: Aids in Processing and Plotting Data from a Lemna-Tec
###   Scananalyzer
### Aliases: imageData-pkg imageData
### Keywords: hplot manip package

### ** Examples
## Not run: 
##D ### This example can be run because the data.frame RiceRaw.dat is available with the package
##D #'# Step 1: Import the raw data
##D data(RiceRaw.dat)
##D 
##D #'# Step 2: Select imaging variables and add covariates and factors (produces longi.dat)
##D longi.dat <- longitudinalPrime(data=RiceRaw.dat, smarthouse.lev=c("NE","NW"))
##D 
##D longi.dat <- designFactors(longi.dat, insertName = "xDays",
##D                            designfactorMethod="StandardOrder")
##D 
##D #'## Particular edits to longi.dat
##D longi.dat <- within(longi.dat, 
##D                     { 
##D                       Days.after.Salting <- as.numfac(Days) - 29
##D                     })
##D longi.dat <- with(longi.dat, longi.dat[order(Snapshot.ID.Tag,Days), ])
##D 
##D #'# Step 3: Form derived traits that result in a value for each observation
##D #'### Set responses
##D responses.image <- c("Area")
##D responses.smooth <- paste(responses.image, "smooth", sep=".")
##D 
##D #'## Form growth rates for each observation of a subset of responses by differencing
##D longi.dat <- splitContGRdiff(longi.dat, responses.image, 
##D                              INDICES="Snapshot.ID.Tag",
##D                              which.rates = c("AGR","RGR"))
##D 
##D #'## Form Area.WUE 
##D longi.dat <- within(longi.dat, 
##D                     { 
##D                       Area.WUE <- WUI(Area.AGR*Days.diffs, Water.Loss)
##D                     })
##D 
##D #'## Add cumulative responses 
##D longi.dat <- within(longi.dat, 
##D                     { 
##D                       Water.Loss.Cum <- unlist(by(Water.Loss, Snapshot.ID.Tag, 
##D                                                   cumulate, exclude.1st=TRUE))
##D                       WUE.cum <- Area / Water.Loss.Cum 
##D                     })
##D 
##D #'# Step 4: Fit splines to smooth the longitudinal trends in the primary traits and
##D #'# calculate their growth rates
##D #'
##D #'## Smooth responses
##D #+
##D for (response in c(responses.image, "Water.Loss"))
##D   longi.dat <- splitSplines(longi.dat, response, x="xDays", INDICES = "Snapshot.ID.Tag", 
##D                             df = 4, na.rm=TRUE)
##D longi.dat <- with(longi.dat, longi.dat[order(Snapshot.ID.Tag, xDays), ])
##D 
##D #'## Loop over smoothed responses, forming growth rates by differences
##D #+
##D responses.GR <- paste(responses.smooth, "AGR", sep=".")
##D longi.dat <- splitContGRdiff(longi.dat, responses.smooth, 
##D                              INDICES="Snapshot.ID.Tag",
##D                              which.rates = c("AGR","RGR"))
##D 
##D #'## Finalize longi.dat
##D longi.dat <- with(longi.dat, longi.dat[order(Snapshot.ID.Tag, xDays), ])
##D 
##D #'# Step 5: Do exploratory plots on unsmoothed and smoothed longitudinal data
##D responses.longi <- c("Area","Area.AGR","Area.RGR", "Area.WUE")
##D responses.smooth.plot <- c("Area.smooth","Area.smooth.AGR","Area.smooth.RGR")
##D titles <- c("Total area (1000 pixels)", 
##D             "Total area AGR (1000 pixels per day)", "Total area RGR (per day)",
##D             "Total area WUE (1000 pixels per mL)")
##D titles.smooth<-titles
##D nresp <- length(responses.longi)
##D limits <- list(c(0,1000), c(-50,125), c(-0.05,0.40), c(0,30))
##D 
##D #' ### Plot unsmoothed profiles for all longitudinal  responses 
##D #+ "01-ProfilesAll"
##D klimit <- 0
##D for (k in 1:nresp)
##D { 
##D   klimit <- klimit + 1
##D   longiPlot(data = longi.dat, response = responses.longi[k], 
##D             y.title = titles[k], x="xDays+35.42857143", 
##D             ggplotFuncs = list(geom_vline(xintercept=29, linetype="longdash", size=1), 
##D                                scale_x_continuous(breaks=seq(28, 42, by=2)),
##D                                scale_y_continuous(limits=limits[[klimit]])))
##D }
##D 
##D 
##D #' ### Plot smoothed profiles for all longitudinal responses - GRs by difference
##D #+ "01-SmoothedProfilesAll"
##D nresp.smooth <- length(responses.smooth.plot)
##D limits <- list(c(0,1000), c(0,100), c(0.0,0.40))
##D for (k in 1:nresp.smooth)
##D { 
##D   longiPlot(data = longi.dat, response = responses.smooth.plot[k], 
##D             y.title = titles.smooth[k], x="xDays+35.42857143", 
##D             ggplotFuncs = list(geom_vline(xintercept=29, linetype="longdash", size=1), 
##D                                scale_x_continuous(breaks=seq(28, 42, by=2)),
##D                                scale_y_continuous(limits=limits[[klimit]])))
##D   print(plt)
##D }
##D 
##D 
##D #'### AGR anomalies - plot without anomalous plants followed by plot of anomalous plants
##D #+ "01-0254-AGRanomalies"
##D anom.ID <- vector(mode = "character", length = 0L)
##D response <- "Area.smooth.AGR"
##D cols.output <- c("Snapshot.ID.Tag", "Smarthouse", "Lane", "Position", 
##D                  "Treatment.1", "Genotype.ID", "Days")
##D anomalous <- anomPlot(longi.dat, response=response, lower=2.5, start.time=40, 
##D                       x = "xDays+35.42857143", vertical.line=29, breaks=seq(28, 42, by=2), 
##D                       whichPrint=c("innerPlot"), y.title=response)
##D subs <- subset(anomalous$data, Area.smooth.AGR.anom & Days==42)
##D if (nrow(subs) == 0)
##D { cat("\n#### No anomalous data here\n\n")
##D } else
##D { 
##D   subs <- subs[order(subs["Smarthouse"],subs["Treatment.1"], subs[response]),]
##D   print(subs[c(cols.output, response)])
##D   anom.ID <- unique(c(anom.ID, subs$Snapshot.ID.Tag))
##D   outerPlot <- anomalous$outerPlot  + geom_text(data=subs,
##D                                                 aes_string(x = "xDays+35.42857143", 
##D                                                            y = response, 
##D                                                            label="Snapshot.ID.Tag"), 
##D                                                 size=3, hjust=0.7, vjust=0.5)
##D   print(outerPlot)
##D }
##D 
##D 
##D #'# Step 6: Form single-value plant responses in Snapshot.ID.Tag order.
##D #'
##D #'## 6a) Set up a data frame with factors only
##D #+
##D cart.dat <- longi.dat[longi.dat$Days == 31, 
##D                       c("Smarthouse","Lane","Position","Snapshot.ID.Tag",
##D                         "xPosn","xMainPosn",
##D                         "Zones","xZones","SHZones","ZLane","ZMainplots", "Subplots",
##D                         "Genotype.ID","Treatment.1")]
##D cart.dat <- cart.dat[do.call(order, cart.dat), ]
##D 
##D #'## 6b) Get responses based on first and last date.
##D #'
##D #'### Observation for first and last date
##D cart.dat <- cbind(cart.dat, getDates(responses.image, data = longi.dat, 
##D                                      which.times = c(31), suffix = "first"))
##D cart.dat <- cbind(cart.dat, getDates(responses.image, data = longi.dat, 
##D                                      which.times = c(42), suffix = "last"))
##D cart.dat <- cbind(cart.dat, getDates(c("WUE.cum"), 
##D                                      data = longi.dat, 
##D                                      which.times = c(42), suffix = "last"))
##D responses.smooth <- paste(responses.image, "smooth", sep=".")
##D cart.dat <- cbind(cart.dat, getDates(responses.smooth, data = longi.dat, 
##D                                      which.times = c(31), suffix = "first"))
##D cart.dat <- cbind(cart.dat, getDates(responses.smooth, data = longi.dat, 
##D                                      which.times = c(42), suffix = "last"))
##D 
##D #'### Growth rates over whole period.
##D #+
##D tottime <- 42 - 31
##D cart.dat <- within(cart.dat, 
##D                    { 
##D                      Area.AGR <- (Area.last - Area.first)/tottime
##D                      Area.RGR <- log(Area.last / Area.first)/tottime
##D                    })
##D 
##D #'### Calculate water index over whole period
##D cart.dat <- merge(cart.dat, 
##D                   intervalWUI("Area", water.use = "Water.Loss", 
##D                               start.times = c(31), 
##D                               end.times = c(42), 
##D                               suffix = NULL, 
##D                               data = longi.dat, include.total.water = TRUE),
##D                   by = c("Snapshot.ID.Tag"))
##D names(cart.dat)[match(c("Area.WUI","Water.Loss.Total"),names(cart.dat))] <- 
##D         c("Area.Overall.WUE", "Water.Loss.Overall")
##D cart.dat$Water.Loss.rate.Overall <- cart.dat$Water.Loss.Overall / (42 - 31)
##D 
##D #'## 6c) Add growth rates and water indices for intervals
##D #'### Set up intervals
##D #+
##D start.days <- list(31,35,31,38)
##D end.days <- list(35,38,38,42)
##D suffices <- list("31to35","35to38","31to38","38to42")
##D 
##D #'### Rates for specific intervals from the smoothed data by differencing
##D #+
##D for (r in responses.smooth)
##D { for (k in 1:length(suffices))
##D   { 
##D     cart.dat <- merge(cart.dat, 
##D                       intervalGRdiff(r, 
##D                                      which.rates = c("AGR","RGR"), 
##D                                      start.times = start.days[k][[1]], 
##D                                      end.times = end.days[k][[1]], 
##D                                      suffix.interval = suffices[k][[1]], 
##D                                      data = longi.dat),
##D                       by = "Snapshot.ID.Tag")
##D   }
##D }
##D 
##D #'### Water indices for specific intervals from the unsmoothed and smoothed data
##D #+
##D for (k in 1:length(suffices))
##D { 
##D   cart.dat <- merge(cart.dat, 
##D                     intervalWUI("Area", water.use = "Water.Loss", 
##D                                 start.times = start.days[k][[1]], 
##D                                 end.times = end.days[k][[1]], 
##D                                 suffix = suffices[k][[1]], 
##D                                 data = longi.dat, include.total.water = TRUE),
##D                     by = "Snapshot.ID.Tag")
##D   names(cart.dat)[match(paste("Area.WUI", suffices[k][[1]], sep="."), 
##D                         names(cart.dat))] <- paste("Area.WUE", suffices[k][[1]], sep=".")
##D   cart.dat[paste("Water.Loss.rate", suffices[k][[1]], sep=".")] <- 
##D            cart.dat[[paste("Water.Loss.Total", suffices[k][[1]], sep=".")]] / 
##D                                            ( end.days[k][[1]] - start.days[k][[1]])
##D }
##D 
##D cart.dat <- with(cart.dat, cart.dat[order(Snapshot.ID.Tag), ])
##D 
##D #'# Step 7: Form continuous and interval SIITs
##D #'
##D #'## 7a) Calculate continuous
##D #+
##D cols.retained <-  c("Snapshot.ID.Tag","Smarthouse","Lane","Position",
##D                     "Days","Snapshot.Time.Stamp", "Hour", "xDays",
##D                     "Zones","xZones","SHZones","ZLane","ZMainplots",
##D                     "xMainPosn", "Genotype.ID")
##D responses.GR <- c("Area.smooth.AGR","Area.smooth.AGR","Area.smooth.RGR")
##D suffices.results <- c("diff", "SIIT", "SIIT")
##D responses.SIIT <- unlist(Map(paste, responses.GR, suffices.results,sep="."))
##D 
##D longi.SIIT.dat <- 
##D   twoLevelOpcreate(responses.GR, longi.dat, suffices.treatment=c("C","S"),
##D                    operations = c("-", "/", "/"), suffices.results = suffices.results, 
##D                    columns.retained = cols.retained, 
##D                    by = c("Smarthouse","Zones","ZMainplots","Days"))
##D longi.SIIT.dat <- with(longi.SIIT.dat, 
##D                             longi.SIIT.dat[order(Smarthouse,Zones,ZMainplots,Days),])
##D 
##D #' ### Plot SIIT profiles 
##D #' 
##D #+ "03-SIITProfiles"
##D k <- 2
##D nresp <- length(responses.SIIT)
##D limits <- with(longi.SIIT.dat, list(c(min(Area.smooth.AGR.diff, na.rm=TRUE),
##D                                       max(Area.smooth.AGR.diff, na.rm=TRUE)),
##D                                     c(0,3),
##D                                     c(0,1.5)))
##D #Plots
##D for (k in 1:nresp)
##D { 
##D   longiPlot(data = longi.SIIT.dat, x="xDays+35.42857143", 
##D             response = responses.SIIT[k], 
##D             y.title=responses.SIIT[k], 
##D             facet.x="Smarthouse", facet.y=".", 
##D             ggplotFuncs = list(geom_vline(xintercept=29, linetype="longdash", size=1), 
##D                                scale_x_continuous(breaks=seq(28, 42, by=2)),
##D                                scale_y_continuous(limits=limits[[klimit]])))
##D }
##D 
##D #'## 7b) Calculate interval SIITs and check for large values for SIIT for Days 31to35
##D #+ "01-SIITIntClean"
##D suffices <- list("31to35","35to38","31to38","38to42")
##D response <- "Area.smooth.RGR.31to35"
##D SIIT <- paste(response, "SIIT", sep=".")
##D responses.SIITinterval <- as.vector(outer("Area.smooth.RGR", suffices, paste, sep="."))
##D 
##D cart.SIIT.dat <- twoLevelOpcreate(responses.SIITinterval, cart.dat, 
##D                                   suffices.treatment=c("C","S"), 
##D                                   suffices.results="SIIT", 
##D                                   columns.suffixed="Snapshot.ID.Tag")
##D tmp<-na.omit(cart.SIIT.dat)
##D print(summary(tmp[SIIT]))
##D big.SIIT <- with(tmp, tmp[tmp[SIIT] > 1.15, c("Snapshot.ID.Tag.C","Genotype.ID",
##D                                               paste(response,"C",sep="."), 
##D                                               paste(response,"S",sep="."), SIIT)])
##D big.SIIT <- big.SIIT[order(big.SIIT[SIIT]),]
##D print(big.SIIT)
##D plt <- ggplot(tmp, aes_string(SIIT)) +
##D            geom_histogram(aes(y = ..density..), binwidth=0.05) +
##D            geom_vline(xintercept=1.15, linetype="longdash", size=1) +
##D            theme_bw() + facet_grid(Smarthouse ~.)
##D print(plt)
##D plt <- ggplot(tmp, aes_string(x="Smarthouse", y=SIIT)) +
##D            geom_boxplot() + theme_bw()
##D print(plt)
##D remove(tmp)
## End(Not run)


