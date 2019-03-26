## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
vs <- t(rgl::icosahedron3d()$vb[1:3,])
head(vs)

## ---- message=FALSE------------------------------------------------------
library(geometry)
tetrahedra <- delaunayn(vs, options="Qz")
head(tetrahedra)

## ------------------------------------------------------------------------
library(uniformly)
volumes <- 
  apply(tetrahedra, 1, 
        function(t){
          volume_tetrahedron(vs[t[1],], vs[t[2],], vs[t[3],], vs[t[4],])
        })

## ------------------------------------------------------------------------
probs <- volumes/sum(volumes)

## ------------------------------------------------------------------------
i <- sample.int(nrow(tetrahedra), 1, prob=probs)
th <- tetrahedra[i,]
runif_in_tetrahedron(1, vs[th[1],], vs[th[2],], vs[th[3],], vs[th[4],])

## ------------------------------------------------------------------------
nsims <- 100
sims <- matrix(NA_real_, nrow=nsims, ncol=3)
for(k in 1:nsims){
  th <- tetrahedra[sample.int(nrow(tetrahedra), 1, prob=probs),]
  sims[k,] <- runif_in_tetrahedron(1, vs[th[1],], vs[th[2],], vs[th[3],], vs[th[4],])
}

## ------------------------------------------------------------------------
library(rgl)
open3d(windowRect=c(100,100,600,600))
shade3d(icosahedron3d(), color="red", alpha=0.3)
points3d(sims)
rglwidget()

## ------------------------------------------------------------------------
vs <- rbind(
  c(7.889562, 1.150329, -2.173651),
  c(2.212808, 1.150329, -2.230414),
  c(0.068023, 1.150328, -7.923502),
  c(-2.151306, 1.150329, -2.254857),
  c(-7.817406, 1.150328, -2.261558),
  c(-3.523133, 1.150328, 1.888122),
  c(-4.869315, 1.150328, 6.987552),
  c(-0.006854, 1.150329, 4.473047),
  c(4.838127, 1.150328, 7.041885),
  c(3.538153, 1.150329, 1.927652),
  c(0.033757, 0.000000, -0.314657),
  c(0.035668, 2.269531, -0.312831)
)
faces <- rbind(
  c(1, 11, 2),
  c(2, 11, 3),
  c(3, 11, 4),
  c(4, 11, 5),
  c(5, 11, 6),
  c(6, 11, 7),
  c(7, 11, 8),
  c(8, 11, 9),
  c(9, 11, 10),
  c(10, 11, 1),
  c(1, 12, 10),
  c(10, 12, 9),
  c(9, 12, 8),
  c(8, 12, 7),
  c(7, 12, 6),
  c(6, 12, 5),
  c(5, 12, 4),
  c(4, 12, 3),
  c(3, 12, 2),
  c(2, 12, 1)
)
open3d(windowRect=c(100,100,600,600))
for(i in 1:nrow(faces)){
 triangles3d(rbind(
   vs[faces[i,1],], 
   vs[faces[i,2],], 
   vs[faces[i,3],]), 
   color="red", alpha=0.4)
}
rglwidget()

## ------------------------------------------------------------------------
centroid <- colMeans(vs)
volumes <- apply(faces, 1,function(f){
  volume_tetrahedron(vs[f[1],], vs[f[2],], vs[f[3],], centroid)
})
probs <- volumes/sum(volumes)

## ------------------------------------------------------------------------
nsims <- 500
sims <- matrix(NA_real_, nrow=nsims, ncol=3)
for(k in 1:nsims){
  f <- faces[sample.int(nrow(faces), 1, prob=probs),]
  sims[k,] <- runif_in_tetrahedron(1, vs[f[1],], vs[f[2],], vs[f[3],], centroid)
}

## ------------------------------------------------------------------------
points3d(sims)
rglwidget()

