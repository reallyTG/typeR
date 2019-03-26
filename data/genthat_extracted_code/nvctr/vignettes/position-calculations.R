## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = "220px",
  fig.align = 'center'
)

library(png)
library(nvctr)
library(knitcitations)

## ----example-01-fig,fig.cap='A and B to delta.',fig.pos='hbt',fig.width=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex1img.png")

## ----example-01-init-----------------------------------------------------
# Position A:
lat_EA <- rad(1)
lon_EA <- rad(2)
z_EA <- 3

# Position B:
lat_EB <- rad(4)
lon_EB <- rad(5)
z_EB <- 6

## ----example-01-step01---------------------------------------------------
(n_EA_E <- lat_lon2n_E(lat_EA, lon_EA))
(n_EB_E <- lat_lon2n_E(lat_EB, lon_EB))

## ----example-01-step02---------------------------------------------------
(p_AB_E <-  n_EA_E_and_n_EB_E2p_AB_E(n_EA_E, n_EB_E, z_EA, z_EB))

## ----example-01-step03---------------------------------------------------
(R_EN <- n_E2R_EN(n_EA_E))

## ----example-01-step04---------------------------------------------------
# (Note the transpose of R_EN: The "closest-rule" says that when
# decomposing, the frame in the subscript of the rotation matrix that is
# closest to the vector, should equal the frame where the vector is
# decomposed. Thus the calculation R_NE*p_AB_E is correct, since the vector
# is decomposed in E, and E is closest to the vector. In the above example
# we only had R_EN, and thus we must transpose it: base::t(R_EN) = R_NE)
(p_AB_N <- base::t(R_EN) %*% p_AB_E %>%  
  as.vector())

## ----example-01-step05---------------------------------------------------
(azimuth <- atan2(p_AB_N[2], p_AB_N[1]) %>%   # positive angle about down-axis
  deg())

## ----example-02-fig,fig.cap='B and delta to C.',fig.pos='hbt',fig.height=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex2img.png")

## ----example-02-init-----------------------------------------------------
p_BC_B <- c(3000, 2000, 100)

# Position and orientation of B is given:
(n_EB_E <- unit(c(1, 2, 3))) # unit() to get unit length of vector
z_EB <- -400
(R_NB <- zyx2R(rad(10),rad(20),rad(30))) # the three angles are yaw, pitch, and roll

# A custom reference ellipsoid is given (replacing WGS-84):
# (WGS-72)
a <- 6378135
f <- 1 / 298.26 

## ----example-02-step01---------------------------------------------------
(R_EN <- n_E2R_EN(n_EB_E))

## ----example-02-step02---------------------------------------------------
(R_EB <- R_EN %*% R_NB) # Note: closest frames cancel

## ----example-02-step03---------------------------------------------------
(p_BC_E <- R_EB %*% p_BC_B) # no transpose of R_EB, since the vector is in B)

## ----example-02-step04---------------------------------------------------
l <- n_EA_E_and_p_AB_E2n_EB_E(n_EB_E, p_BC_E, z_EB, a, f)
(n_EB_E <- l[['n_EB_E']])
(z_EB <- l[['z_EB']])

## ----example-02-final----------------------------------------------------
lat_lon_EB <- n_E2lat_lon(n_EB_E)
(latitude  <- lat_lon_EB[1])
(longitude <- lat_lon_EB[2])

# height (= - depth)
(height <- -z_EB)

## ----example-03-fig,fig.cap='ECEF-vector to geodetic latitude.',fig.pos='hbt',fig.height=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex3img.png")

## ----example-03-init-----------------------------------------------------
(p_EB_E <- 6371e3 * c(0.9, -1, 1.1)) # m

## ----example-03-step01---------------------------------------------------
l <- p_EB_E2n_EB_E(p_EB_E)
(n_EB_E <- l[['n_EB_E']])
(z_EB <- l[['z_EB']])

## ----example-03-final----------------------------------------------------
lat_lon_EB <- n_E2lat_lon(n_EB_E)
(latEB  <- lat_lon_EB[1])
(lonEB <- lat_lon_EB[2])

# height (= - depth)
(hEB <- -z_EB)

## ----example-04-fig,fig.cap='Geodetic latitude to ECEF-vector.',fig.pos='hbt',fig.height=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex4img.png")

## ----example-04-init-----------------------------------------------------
lat_EB <- rad(1)
lon_EB <- rad(2)
h_EB <- 3

## ----example-04-step01---------------------------------------------------
(n_EB_E <- lat_lon2n_E(lat_EB, lon_EB))

## ----example-04-step02---------------------------------------------------
(p_EB_E <- n_EB_E2p_EB_E(n_EB_E, -h_EB))

## ----example-05-fig,fig.cap='Surface distance.',fig.pos='hbt',fig.height=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex5img.png")

## ----example-05-init-----------------------------------------------------
n_EA_E <- lat_lon2n_E(rad(88), rad(0));
n_EB_E <- lat_lon2n_E(rad(89), rad(-170))
r_Earth <- 6371e3

## ----example-05-spherical------------------------------------------------
(s_AB <- (atan2(base::norm(pracma::cross(n_EA_E, n_EB_E), type = "2"),
                pracma::dot(n_EA_E, n_EB_E)) * r_Earth))

## ----example-05-step02---------------------------------------------------
(d_AB <- base::norm(n_EB_E - n_EA_E, type = "2") * r_Earth)

## ----example-05-geodesic-------------------------------------------------
geosphere::distGeo(c(0, 88), c(-170, 89))

## ----example-06-fig,fig.cap='Interpolated position.',fig.pos='hbt',fig.height=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex6img.png")

## ----example-06-init-----------------------------------------------------
n_EB_E_t0 <- lat_lon2n_E(rad(89.9), rad(-150))
n_EB_E_t1 <- lat_lon2n_E(rad(89.9), rad(150))

# The times are given as:
t0 <- 10
t1 <- 20
ti <- 16 # time of interpolation

## ----exemple-06-interpolation--------------------------------------------
t_frac <- (ti - t0) / (t1 - t0) 
(n_EB_E_ti <- unit(n_EB_E_t0 + t_frac * (n_EB_E_t1 - n_EB_E_t0) ))

## ----example-06-conversion-----------------------------------------------
(l  <- n_E2lat_lon(n_EB_E_ti) %>% deg())
(latitude  <- l[1])
(longitude <- l[2])

## ----example-07-fig,fig.cap='Mean position (center/midpoint).',fig.pos='hbt',fig.height=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex7img.png")

## ----example-07-init-----------------------------------------------------
n_EA_E <- lat_lon2n_E(rad(90), rad(0))
n_EB_E <- lat_lon2n_E(rad(60), rad(10))
n_EC_E <- lat_lon2n_E(rad(50), rad(-20))

## ----example-07-geographical-mean----------------------------------------
(n_EM_E <- unit(n_EA_E + n_EB_E + n_EC_E))

## ----example-07-conversion-----------------------------------------------
(l  <- n_E2lat_lon(n_EM_E) %>% deg())
(latitude  <- l[1])
(longitude <- l[2])

## ----example-08-fig,fig.cap='A and azimuth/distance to B.',fig.pos='hbt',fig.height=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex8img.png")

## ----example-08-init-----------------------------------------------------
n_EA_E <- lat_lon2n_E(rad(80),rad(-90))
azimuth <- rad(200)
s_AB <- 1000 # distance (m)
r_Earth <- 6371e3 # mean Earth radius (m)

## ------------------------------------------------------------------------
k_east_E <- unit(pracma::cross(base::t(R_Ee()) %*% c(1, 0, 0) %>% as.vector(), n_EA_E))
k_north_E <- pracma::cross(n_EA_E, k_east_E)

## ------------------------------------------------------------------------
d_E <- k_north_E * cos(azimuth) + k_east_E * sin(azimuth)

## ------------------------------------------------------------------------
n_EB_E <- n_EA_E * cos(s_AB / r_Earth) + d_E * sin(s_AB / r_Earth)

## ----example-08-conversion-----------------------------------------------
(l  <- n_E2lat_lon(n_EB_E) %>% deg())
(latitude  <- l[1])
(longitude <- l[2])

## ----example-09-fig,fig.cap='Intersection of two paths.',fig.pos='hbt',fig.height=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex9img.png")

## ----example-09-init-----------------------------------------------------
n_EA1_E <- lat_lon2n_E(rad(50), rad(180))
n_EA2_E <- lat_lon2n_E(rad(90), rad(180))
n_EB1_E <- lat_lon2n_E(rad(60), rad(160))
n_EB2_E <- lat_lon2n_E(rad(80), rad(-140))

# These are from the python version (results are the same ;-)
# n_EA1_E <- lat_lon2n_E(rad(10), rad(20))
# n_EA2_E <- lat_lon2n_E(rad(30), rad(40))
# n_EB1_E <- lat_lon2n_E(rad(50), rad(60))
# n_EB2_E <- lat_lon2n_E(rad(70), rad(80))


## ------------------------------------------------------------------------
n_EC_E_tmp <- unit(pracma::cross(
  pracma::cross(n_EA1_E, n_EA2_E),
  pracma::cross(n_EB1_E, n_EB2_E)))

## ------------------------------------------------------------------------
n_EC_E <- sign(pracma::dot(n_EC_E_tmp, n_EA1_E)) * n_EC_E_tmp

## ----example-09-conversion-----------------------------------------------
(l  <- n_E2lat_lon(n_EC_E) %>% deg())
(latitude  <- l[1])
(longitude <- l[2])

## ----example-10-fig,fig.cap='Cross track distance (cross track error).',fig.pos='hbt',fig.height=4,echo=FALSE,warning=FALSE,message=FALSE----
knitr::include_graphics("ex10img.png")

## ------------------------------------------------------------------------
n_EA1_E <- lat_lon2n_E(rad(0), rad(0))
n_EA2_E <- lat_lon2n_E(rad(10),rad(0))
n_EB_E  <- lat_lon2n_E(rad(1), rad(0.1))

r_Earth <- 6371e3  # mean Earth radius (m)

## ------------------------------------------------------------------------
c_E <- unit(pracma::cross(n_EA1_E, n_EA2_E))

## ------------------------------------------------------------------------
(s_xt <- (acos(pracma::dot(c_E, n_EB_E)) - pi / 2) * r_Earth)

## ------------------------------------------------------------------------
(d_xt <- -pracma::dot(c_E, n_EB_E) * r_Earth)

