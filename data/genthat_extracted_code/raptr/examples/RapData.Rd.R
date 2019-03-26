library(raptr)


### Name: RapData
### Title: Create new RapData object
### Aliases: RapData

### ** Examples

# load data
data(cs_pus, cs_spp, cs_space)

# create data for RapData object
attribute.spaces <- list(
  AttributeSpaces(name = "geographic", list(
    AttributeSpace(
      planning.unit.points = PlanningUnitPoints(
        rgeos::gCentroid(cs_pus[1:10,], byid = TRUE)@coords, seq_len(10)),
      demand.points = make.DemandPoints(
        randomPoints(cs_spp[[1]], n = 10, prob = TRUE)),
      species = 1L))),
  AttributeSpaces(name = "environmental", list(
    AttributeSpace(
      planning.unit.points = PlanningUnitPoints(
        raster::extract(cs_space[[1]], cs_pus[1:10,], fun = mean),
        seq_len(10)),
      demand.points = make.DemandPoints(
        cs_space[[1]][raster::Which(!is.na(cs_space[[1]]))]),
        species = 1L))))
pu.species.probabilities <- calcSpeciesAverageInPus(cs_pus[1:10,],
                                                    cs_spp[[1]])
polygons <- SpatialPolygons2PolySet(cs_pus[1:10,])
boundary <- calcBoundaryData(cs_pus[1:10,])

x <- RapData(pu = cs_pus@data[1:10,], species = data.frame(name = "test"),
             target = data.frame(species = 1L, target = 0:2,
                                 proportion = 0.2),
             pu.species.probabilities = pu.species.probabilities,
             attribute.spaces = attribute.spaces,
             polygons = polygons,
             boundary = boundary)

# print object
print(x)




