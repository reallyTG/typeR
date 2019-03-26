## ------------------------------------------------------------------------
#- an introduction example

mm <- matrix(
  data = c(
    1,  5,  8,  5, 8,
    3, 13,  3, 13, 3,
    2,  2, 21,  2, 21
  ), 
  nrow = 3, ncol = 5, byrow = TRUE, 
  dimnames = list(
    paste0("s", 1:3), paste0("t", 1:5)
  ))

mm


## ----message=FALSE, results='hide'---------------------------------------
#- a zip find example
library(skm) # also load data.table, magrittr and Rcpp

#- create source - target - population weighted distance matrix

#- source
dsrc <- skm::zip2012[zip %in% skm::source_zip_list, .(s = zip, s_lat = lat, s_lng = lng)]

#- target
ddst <- skm::zip2012[ , .(t = zip, t_lat = lat, t_lng = lng, p_pop = p_pop)]

#- create source - target - population weighted distance data.table

#- CJ.data.table extends CJ from data.table to cross join data.table - see yg::CJ.dt
CJ.data.table <- function(X, Y) {

  stopifnot(is.data.table(X), is.data.table(Y))

  k = NULL

  X = X[, c(k = 1L, .SD)]
  setkey(X, k)

  Y = Y[, c(k = 1L, .SD)]
  setkey(Y, NULL)

  return( X[Y, allow.cartesian=TRUE][, k := NULL][] )

}

ddzt <- CJ.data.table(dsrc, ddst) %>% setorder(s, t) %>%
  .[ , `:=`(d = skm::dist_wlatlng(s_lat, s_lng, t_lat, t_lng), w = p_pop)]

#- ddzt has 1,471,044 row each with source zip in s, target zip in t, 
#- and population weighted distance in d

#- convert source - target - population weighted distance data.table into matrix
dmtx <- ddzt %>%
  .[ , `:=`(
    wd = d * w
  )] %>%
  data.table::dcast(
    s ~ t, value.var = "wd"
  )

sname <- dmtx[["s"]]

set(dmtx, i = NULL, j = 1L, value = NULL) # dmtx[ , `:=`(s = NULL)]

tname <- names(dmtx)

dmtx <- as.matrix(dmtx)

rownames(dmtx) <- sname
colnames(dmtx) <- tname


## ------------------------------------------------------------------------
round(dmtx[1L:4L, 1L:10L] * 10L^4L, 4L)

## ------------------------------------------------------------------------

#- select 10 from 51 candidate locations to provide service for 28,444 houses 
#- with the objective of minimizing the population weighted average distances
#- note that the row indicies are indexed from 0 following the cpp convention
m0 <- skm::skm_sgl_cpp(
  x = dmtx, s_init = c(0L, 1L, 2L, 3L, 5L, 8L, 13L, 21L, 34L, 4L), s_must = integer(0), max_it = 1000L
)

m0$o # objective: sum of column minimial

m0$s # selected source: row index set indexed from 0 so c(0L, 4L) implies rownames(dmtx)[c(1L, 5L)] = c("02124", "05452")

sname[m0$s + 1L]

#- must have candidate locations rownames(dmtx)[c(5L, 11L)] = c("05452", "20011") in the solution
m1 <- skm::skm_sgl_cpp(
  x = dmtx, s_init = c(0L, 1L, 2L, 3L, 5L, 8L, 13L, 21L, 34L, 4L), s_must = c(4L, 10L), max_it = 1000L
)

m1$o

sname[m1$s + 1L]


## ------------------------------------------------------------------------
m2 <- skm::skm_rgi_cpp(
  x = dmtx, k = 10L, s_must = integer(0), max_it = 1000L
)

m2$o

sname[m2$s + 1L]


## ------------------------------------------------------------------------

#- g is important when the size of s is large
#- g should be an integer vector same length as s, value indicate groups
gname <- sname %>% vapply(substr, "", 1L, 1L) %>% unname %>% as.integer()

m3 <- skm::skm_rgs_cpp(
  x = dmtx, k = 10L, g = gname, s_must = integer(0), max_it = 1000L
)

m3$o

sname[m3$s + 1L]


## ------------------------------------------------------------------------

#- multiple random initial points to overcome local optimial issue
m4 <- skm::skm_mlp_cpp(
  x = dmtx, k = 10L, s_must = integer(0), max_it = 1000L, max_at = 4L
)

m4$o

sname[m4$s + 1L]

m4$o_list # optimial objective find with each of the 4 random initial points

#- str(m4$s_list) is num [1:4, 1:10] but not a matrix?
apply(m4$s_list, 2L, function(s) { sname[s + 1L] }) # selected sources obtained with each of the 4 random initial points


## ------------------------------------------------------------------------

#- multiple random initial points initialized using stratified sampling w.r.t g
m5 <- skm::skm_mls_cpp(
  x = dmtx, k = 10L, g = gname, s_must = integer(0), max_it = 1000L, max_at = 4L
)

m5$o

sname[m5$s + 1L]

m5$o_list

apply(m5$s_list, 2L, function(s) { sname[s + 1L] })


## ------------------------------------------------------------------------
s_ggrp <- data.table(s = sname, g = gname)
s_ggrp[c(5L, 8L, 13L, 21L, 34L)]

## ----message=FALSE-------------------------------------------------------
# ddzt <- ddzt[ , .(s, t, d, w)]

m6 <- skm::skm_mls(
  x = ddzt, k = 1L:10L, s_colname = "s", t_colname = "t", d_colname = "d", w_colname = "w",
  s_ggrp = integer(0L), s_must = integer(0L), max_it = 1000L, max_at = 1000L, 
  auto_create_ggrp = TRUE, extra_immaculatism = TRUE, extra_at = 200L
)

m6


## ----message=FALSE-------------------------------------------------------

m7 <- skm::skm_gdp_cpp(
  x = dmtx, k = 10L
)

m7

# obtain the objective population weighted average distance from the row index vector m7
sum(apply(dmtx[m7 + 1L, ], 2L, min))


