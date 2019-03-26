library(Rpolyhedra)


### Name: getAvailablePolyhedra
### Title: Get available polyhedra
### Aliases: getAvailablePolyhedra

### ** Examples


#gets all polyhedra in the database
available.polyhedra <- getAvailablePolyhedra()

#returns all polyhedra from a given source, in this case, netlib
available.netlib.polyhedra <- getAvailablePolyhedra(sources="netlib")

#search within the polyhedron names

cube <- getAvailablePolyhedra(sources="netlib",search.string="cube")
cube



