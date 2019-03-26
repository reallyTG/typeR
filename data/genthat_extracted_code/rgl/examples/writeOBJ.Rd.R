library(rgl)


### Name: writeOBJ
### Title: Read and write Wavefront OBJ format files
### Aliases: writeOBJ readOBJ
### Keywords: graphics

### ** Examples

filename <- tempfile(fileext = ".obj")
open3d()
shade3d( icosahedron3d() )
writeOBJ(filename)

# The motivation for writing readObj() was to read this shape
# file of Comet 67P/Churyumov-Gerasimenko, from the ESA:
## No test: 
open3d()
shade3d(readOBJ(url(
"http://sci.esa.int/science-e/www/object/doc.cfm?fobjectid=54726"
), material = list(col = "gray")))
## End(No test)

# Textures are used in a realistic hand image available from
# https://free3d.com/3d-model/freerealsichand-85561.html
# Thanks to Monte Shaffer for pointing this out.
# Decompress the files into the current directory, convert
# hand_mapNew.jpg to hand_mapNew.png, then use
## Not run: 
##D open3d()
##D shade3d(readOBJ("hand.OBJ", material = list(color = "white", 
##D shininess = 1, texture = "hand_mapNew.png")))
## End(Not run)



