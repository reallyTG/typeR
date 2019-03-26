library(rgl)


### Name: mesh3d
### Title: 3D Mesh objects
### Aliases: shape3d mesh3d as.mesh3d qmesh3d tmesh3d dot3d dot3d.qmesh3d
###   dot3d.mesh3d wire3d wire3d.qmesh3d wire3d.mesh3d shade3d
###   shade3d.qmesh3d shade3d.mesh3d cube3d oh3d tetrahedron3d octahedron3d
###   icosahedron3d dodecahedron3d cuboctahedron3d
### Keywords: dynamic

### ** Examples


  # generate a quad mesh object

  vertices <- c( 
     -1.0, -1.0, 0, 1.0,
      1.0, -1.0, 0, 1.0,
      1.0,  1.0, 0, 1.0,
     -1.0,  1.0, 0, 1.0
  )
  indices <- c( 1, 2, 3, 4 )
  
  open3d()  
  wire3d( qmesh3d(vertices, indices) )
  
  # render 4 meshes vertically in the current view

  open3d()  
  bg3d("gray")
  l0 <- oh3d(tran = par3d("userMatrix"), color = "green" )
  shade3d( translate3d( l0, -6, 0, 0 ))
  l1 <- subdivision3d( l0 )
  shade3d( translate3d( l1 , -2, 0, 0 ), color = "red", override = FALSE )
  l2 <- subdivision3d( l1 )
  shade3d( translate3d( l2 , 2, 0, 0 ), color = "red", override = TRUE )
  l3 <- subdivision3d( l2 )
  shade3d( translate3d( l3 , 6, 0, 0 ), color = "red" )
  
  # render all of the Platonic solids
  open3d()
  shade3d( translate3d( tetrahedron3d(col = "red"), 0, 0, 0) )
  shade3d( translate3d( cube3d(col = "green"), 3, 0, 0) )
  shade3d( translate3d( octahedron3d(col = "blue"), 6, 0, 0) )
  shade3d( translate3d( dodecahedron3d(col = "cyan"), 9, 0, 0) )
  shade3d( translate3d( icosahedron3d(col = "magenta"), 12, 0, 0) )



