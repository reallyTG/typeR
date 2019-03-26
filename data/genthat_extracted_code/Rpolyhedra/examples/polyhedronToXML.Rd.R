library(Rpolyhedra)


### Name: polyhedronToXML
### Title: Polyhedron to XML
### Aliases: polyhedronToXML

### ** Examples

#get the representation of a cube (netlib library)
XML::saveXML(polyhedronToXML(getPolyhedron("netlib", "cube")$state))




