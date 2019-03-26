## ---- eval=FALSE---------------------------------------------------------
#  dgvm3d.locations = read.table("gridlist.txt",
#                                col.names=c("Lon", "Lat", "Name"), sep="\t",
#                                stringsAsFactors=FALSE)
#  dgvm3d.succession=list()
#  for (i in 1:nrow(dgvm3d.locations)) {
#    dgvm3d.succession[[dgvm3d.locations$Name[i]]] =
#    read.LPJ("vegstruct.out",
#             lon=dgvm3d.locations$Lon[i],
#             lat=dgvm3d.locations$Lat[i])
#    dgvm3d.succession[[i]] = dgvm3d.succession[[i]][!(dgvm3d.succession[[i]]$Year %% 5) &
#                                                    dgvm3d.succession[[i]]$Year > 1859, ]
#  }

## ---- message=FALSE------------------------------------------------------
library(DGVM3D)
stand = initStand()
stand3D(stand)
rglwidget()

## ---- message=FALSE, warning=FALSE---------------------------------------
veg = data.frame(DBH=rep(0.05, 250))
veg$Height    = veg$DBH * 35
veg$Crownarea = veg$DBH * 5
veg$LeafType  = sample(1:2, nrow(veg), replace=TRUE)
veg$ShadeType = sample(1:2, nrow(veg), replace=TRUE)
veg$LAI = rep(2, nrow(veg))
veg = rbind(veg, data.frame(DBH=-1, Height=-1, Crownarea=-1, LeafType=-1, ShadeType=3, LAI=0.5))
stand = initStand(npatch=3)
par3d(skipRedraw=TRUE)
stand3D(stand, 1)
dgvm3d.options(establish.method = "random")
stand@patches[[1]]@vegetation = establishTrees(veg, stand@hexagon@supp[['inner.radius']])
stand = plant3D(stand)

stand3D(stand, 2)
dgvm3d.options(establish.method = "sunflower")
stand@patches[[2]]@vegetation = establishTrees(veg, stand@hexagon@supp[['inner.radius']])
stand = plant3D(stand, 2)

stand3D(stand, 3)
dgvm3d.options(establish.method = "row")
stand@patches[[3]]@vegetation = establishTrees(veg, stand@hexagon@supp[['inner.radius']])
stand = plant3D(stand, 3)

par3d(skipRedraw=FALSE)
rot.z = rotationMatrix(pi/3, 0, 0, 1)
rot.y = rotationMatrix(-pi/8, 1, 0, 0)
rgl.viewpoint(userMatrix = rot.y %*% rot.z, fov=1)
snapshot3d("stand_1x2.png")

## ---- message=FALSE, results="hide"--------------------------------------
dgvm3d.options("default")
location <- 'Canada - boreal forest'
for (y in c(1865, 1915, 2005)) {
  open3d(windowRect=c(0, 0, 800, 600), scale=c(1, 1, 1), FOV=0)
  par3d(skipRedraw=TRUE)
  stand = snapshot(dgvm3d.succession[[location]], year=y)
  par3d(skipRedraw=FALSE)
  rgl.clear("lights")
  rgl.light( theta = -25, phi = 30, specular = "black", diffuse = "#FFFFFF")
  axis3d("z", pos=c(-stand@hexagon@supp$outer.radius, 5*stand@hexagon@supp$inner.radius, NA))
  rot.z = rotationMatrix(pi/6, 0, 0, 1)
  rot.y = rotationMatrix(-pi/3, 1, 0, 0)
  rgl.viewpoint(userMatrix = rot.y %*% rot.z, fov=1)
  rgl.snapshot(paste0("snapshot_", y, ".png"))
}

## ---- message=FALSE------------------------------------------------------
location <- "Africa - sahel"
dummy = open3d(windowRect=c(0, 0, 900, 400), scale=c(1, 1, 1), FOV=1)
stand = succession(dgvm3d.succession[[location]], patch.id = c(2, 8, 10), init.year = 1860, years = seq(1905, 2005, 10))
stand3D(stand)
par3d(skipRedraw=TRUE)
stand = plant3D(stand)
fire3D(stand, limit=0.2)
par3d(skipRedraw=FALSE)
rgl.clear("lights")
rgl.light( theta = -25, phi = 30, specular = "black", diffuse = "#FFFFFF")
rot.z = rotationMatrix(-pi/2, 0, 0, 1)
rot.y = rotationMatrix(-pi/3, 1, 0, 0)
rgl.viewpoint(userMatrix = rot.y %*% rot.z, fov=1.5, zoom = 0.5)
rgl.snapshot("succession.png")

