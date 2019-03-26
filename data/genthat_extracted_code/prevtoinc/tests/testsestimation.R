context("Tests for estimation functions")


geom.dist.fct <- function(x) dgeom(x-1, 1/8)
geom.dist <- geom.dist.fct(1:70)/sum(geom.dist.fct(1:70))
a <- length_unbiased_mean(length_biased_dist(geom.dist))
b <- sum(1:length(geom.dist)*geom.dist)
expect_equal(a,b)

pois.dist.fct <- function(x) dpois(x-1, 7)
pois.dist <- pois.dist.fct(1:70)/sum(pois.dist.fct(1:70))
a <- length_unbiased_mean(length_biased_dist(pois.dist))
b <-sum(1:length(pois.dist)*pois.dist)
expect_equal(a,b)

expect_equal(epmf(rep(1:10,10)), rep(1/10,10))

## test conversion function _rhame
context("Testing calculate_I_rhame")
pois.dist <- create_dist_vec(pois_dist_fct, max.dist = 70)
data.pps.fast <- readRDS("refdata/datappsfast.Rds")

I.df <- calculate_I_rhame(data.pps.fast,
                  x.loi.hat = 8,
                  method = "method.identifier")
expect_known_value(I.df, 
                   "refdata/Idf.Rds",
                   update = FALSE)

I.df <- calculate_I_rhame(data.pps.fast,
                          x.loi.hat = 8,
                          x.los.hat = 6,
                          method = "method.identifier")
expect_known_value(I.df, 
                   "refdata/Idflos.Rds",
                   update = FALSE)


## test conversion function _smooth
context("Testing calculate_I_smooth (gren)")
I.df2 <- calculate_I_smooth(data.pps.fast, method = "gren")
expect_known_value(I.df2, 
                   "refdata/Idf2.Rds",
                   update= TRUE)
context("Testing calculate_I_smooth (rear)")
I.df3 <- calculate_I_smooth(data.pps.fast, method = "rear")
expect_known_value(I.df3, 
                   "refdata/Idf3.Rds",
                   update = FALSE)


data.pps.fast$L.loi <- NULL
data.pps.fast$L.los <- NULL
data.pps.fast$A.los <- NULL
I.df4 <- calculate_I(data.pps.fast)
expect_known_value(I.df4, 
                  "refdata/Idf4.Rds",
                  update = FALSE)

