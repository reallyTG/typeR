context("test-sp.R")

data("hsh", package = "gibble")
## a SpatialPolygons, SpatialLines, SpatialMultiPoints
SPS <- hsh[["poly"]]
SLS <- hsh[["line"]]
MPS <- hsh[["point"]]
P1 <- as(MPS, "SpatialPoints")
## a Polygon
P <- SPS@polygons[[1]]@Polygons[[1]]
## a Polygons
PS <- SPS@polygons[[1]]

## a Line
L <- SLS@lines[[1]]@Lines[[1]]
## a Lines
LS <- SLS@lines[[1]]

test_that("sp ibble works", {
  dSPS <- ibble(SPS)
  expect_that(dim(dSPS), equals(c(9L, 5L)))
  dSLS <- ibble(SLS, 1)
  expect_that(dim(dSLS), equals(c(9L, 5L)))

  dMPS <- ibble(MPS)
  expect_that(dim(dMPS), equals(c(50L, 4L)))

  dP1 <- ibble(P1)
  expect_that(dim(dP1), equals(c(50L, 4L)))

  dP <- ibble(P)
  expect_that(dim(dP), equals(c(1L, 4L)))

  dPS <- ibble(PS)
  expect_that(dim(dPS), equals(c(6L, 5L)))

  dL <- ibble(L)
  expect_that(dim(dL), equals(c(1L, 3L)))

  dLS <- ibble(LS)
  expect_that(dim(dLS), equals(c(6L, 5L)))

})


test_that("sp gibble methods exist", {
  gibble.SpatialPolygons(SPS) %>% expect_s3_class("tbl_df") %>%
     expect_named(c("nrow", "ncol", "type", "subobject", "object"))

   gibble.SpatialLines(SLS)  %>% expect_s3_class("tbl_df") %>%
     expect_named(c("nrow", "ncol", "type", "subobject", "object"))

   gibble.SpatialMultiPoints(MPS) %>% expect_s3_class("tbl_df") %>%
     expect_named(c("nrow", "ncol", "type", "object"))

   gibble.SpatialPoints(MPS) %>% expect_s3_class("tbl_df") %>%
     expect_named(c("nrow", "ncol", "type", "object"))

   gibble.Polygons(PS) %>% expect_s3_class("tbl_df") %>%
     expect_named(c("nrow", "ncol", "type", "subobject", "object"))

   gibble.Lines(LS) %>% expect_s3_class("tbl_df") %>%
     expect_named(c("nrow", "ncol", "type", "subobject", "object"))

   gibble.Polygon(P) %>% expect_s3_class("tbl_df") %>%
     expect_named(c("nrow", "ncol", "type", "subobject"))

   gibble.Line(L) %>% expect_s3_class("tbl_df") %>%
     expect_named(c("nrow", "ncol", "type"))
})

test_that("sp dispatch works", {
  gibble(SPS) %>% expect_s3_class("tbl_df") %>%
    expect_named(c("nrow", "ncol", "type", "subobject", "object"))

  gibble(SLS)  %>% expect_s3_class("tbl_df") %>%
    expect_named(c("nrow", "ncol", "type", "subobject", "object"))

  gibble(MPS) %>% expect_s3_class("tbl_df") %>%
    expect_named(c("nrow", "ncol", "type", "object"))

  gibble(P1) %>% expect_s3_class("tbl_df") %>%
    expect_named(c("nrow", "ncol", "type", "object"))

  gibble(PS) %>% expect_s3_class("tbl_df") %>%
    expect_named(c("nrow", "ncol", "type", "subobject", "object"))

  gibble(LS) %>% expect_s3_class("tbl_df") %>%
    expect_named(c("nrow", "ncol", "type", "subobject", "object"))

  gibble(P) %>% expect_s3_class("tbl_df") %>%
    expect_named(c("nrow", "ncol", "type", "subobject"))

  gibble(L) %>% expect_s3_class("tbl_df") %>%
    expect_named(c("nrow", "ncol", "type"))
})


test_that("tests from silicate work", {
  spobj <- minimal_mesh_sp
  splineobj <- minimal_mesh_sp_line
  gibble(spobj) %>% expect_s3_class("tbl_df")
  gibble(splineobj) %>% expect_s3_class("tbl_df")

  expect_that(gibble(hsh$line)$object, equals(c(1, 1, 1, 1, 1, 1, 2, 3, 3)))
  expect_that(gibble(MPS)$object, equals(rep(c(1L, 2L, 3L), c(32, 6, 12))))

}
)
