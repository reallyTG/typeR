library(DSsim)


### Name: make.simulation
### Title: Creates a Simulation object
### Aliases: make.simulation

### ** Examples

## Not run: 
##D # A basic line transect simulation example
##D sim <- make.simulation()
##D check.sim.setup(sim)
##D sim <- run(sim) 
##D summary(sim)
##D 
##D # A basic point transect simulation example
##D sim <- make.simulation(design.obj = make.design("point"))
##D check.sim.setup(sim)
##D sim <- run(sim) 
##D summary(sim)
##D # Note % bias levels will vary due to low number of repetitions 
##D # set by default in these examples
##D 
##D # To increase the number of repetitions
##D sim <- make.simulation(reps = 100)
##D sim <- run(sim) 
##D summary(sim)
## End(Not run)

coords <- gaps <- list()
coords[[1]] <- list(data.frame(x = c(0,1000,1000,0,0), y = c(0,0,
 1000,1000,0)))
gaps[[1]] <- list(data.frame(x = c(400,600,500,350,400), y = c(100,
 250,600,120,100)))

region <- make.region(region.name = "study.area", units = "m", 
 coords = coords, gaps = gaps)
plot(region)

## Not run: 
##D data(transects.shp)
##D #Edit the pathway below to point to an empty folder where the
##D #transect shapefile will be saved
##D shapefile.pathway <- "C:/..."
##D write.shapefile(transects.shp, paste(shapefile.pathway,"/transects_1",
##D  sep = ""))
##D 
##D parallel.design <- make.design(transect.type = "Line", 
##D  design.details = c("Parallel","Systematic"), region = region, 
##D  design.axis = 0, spacing = 100, plus.sampling =FALSE, 
##D  path = shapefile.pathway)
##D 
##D pop.density <- make.density(region.obj = region, x.space = 10, 
##D  y.space = 10, constant = 0.5) 
##D pop.density <- add.hotspot(pop.density, centre = c(50, 200), 
##D  sigma = 100, amplitude = 0.1)
##D pop.density <- add.hotspot(pop.density, centre = c(500, 700), 
##D  sigma = 900, amplitude = 0.05)
##D pop.density <- add.hotspot(pop.density, centre = c(300, 100), 
##D  sigma = 100, amplitude = -0.15)
##D 
##D plot(pop.density)
##D plot(region, add = TRUE)
##D 
##D pop.description <- make.population.description(N = 1000, 
##D  density.obj = pop.density, region = region, fixed.N = TRUE)
##D 
##D detect <- make.detectability(key.function = "hn", scale.param = 15,
##D  truncation = 30) 
##D 
##D ddf.analyses <- make.ddf.analysis.list(dsmodel = list(~cds(key = "hn",
##D  formula = ~1),~cds(key = "hr", formula = ~1)), method = "ds", 
##D  criteria = "AIC")
##D 
##D my.simulation <- make.simulation(reps = 10, single.transect.set = TRUE,
##D  region.obj = region, design.obj = parallel.design, 
##D  population.description.obj = pop.description, 
##D  detectability.obj = detect, ddf.analyses.list = ddf.analyses)
##D 
##D survey.results <- create.survey.results(my.simulation, dht.table = TRUE)
##D 
##D plot(survey.results)
##D 
##D my.simulation <- run(my.simulation)
##D 
##D summary(my.simulation)
## End(Not run)




