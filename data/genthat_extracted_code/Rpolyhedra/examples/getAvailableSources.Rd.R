library(Rpolyhedra)


### Name: getAvailableSources
### Title: Get available sources
### Aliases: getAvailableSources

### ** Examples

#gets all sources in the database
available.sources <- getAvailableSources()

#returns all polyhedra from all sources
available.polyhedra <- getAvailablePolyhedra(sources=available.sources)

#search within the polyhedron names from all sources
cubes <- getAvailablePolyhedra(sources=available.sources,
        search.string="cube")
cubes



