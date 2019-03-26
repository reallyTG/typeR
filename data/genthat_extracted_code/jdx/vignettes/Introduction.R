## ----setup, include=FALSE------------------------------------------------
library("pander")
knitr::opts_chunk$set(echo = TRUE)
# The conversion tables have been copied from mapping.xlsx and converted to R character matrices.
rdata.tables <- "introduction-tables.RData"
load(rdata.tables)

## ------------------------------------------------------------------------
m1 <- matrix(1:6, 2, 3)
m1

## ------------------------------------------------------------------------
library("jdx")
o <- convertToJava(m1)
getJavaClassName(o)

## ------------------------------------------------------------------------
o <- rJava::.jcast(o, "[Ljava/lang/Object;")
rJava::.jcall("java/util/Arrays", "S", "deepToString", o)

## ------------------------------------------------------------------------
m2 <- convertToR(o)
identical(m1, m2)

## ----eval=FALSE----------------------------------------------------------
#  convertToJava(
#    value,
#    length.one.vector.as.array = FALSE,
#    scalars.as.objects = FALSE,
#    array.order = "row-major",
#    data.frame.row.major = TRUE,
#    coerce.factors = TRUE
#  )

## ----results='asis', echo=FALSE------------------------------------------
# load(rdata.tables)
# Highlight and copy the appropriate section in mapping.xlsx before executing the next line
# r2j.length.one.vector.scalars.as.objects.false <- mt(9, 4, what = character(), write.to.clipboard = FALSE)
# file.remove(rdata.tables)
# save.image(file = rdata.tables)
pander::pander(
  r2j.length.one.vector.scalars.as.objects.false
  , split.cells = c("0%", "20%", "20%", "20%", "40%")
  , split.table = 200
  , justify = "left"
  , caption = "`convertToJava()` behavior for length-one vectors when `length.one.vector.as.array = FALSE` and `scalars.as.objects = FALSE`"
  , emphasize.strong.rows = 1
)

## ----results='asis', echo=FALSE------------------------------------------
# load(rdata.tables)
# Highlight and copy the appropriate section in mapping.xlsx before executing the next line
# r2j.length.one.vector.scalars.as.objects.true <- mt(9, 4, what = character(), write.to.clipboard = FALSE)
# file.remove(rdata.tables)
# save.image(file = rdata.tables)
pander::pander(
  r2j.length.one.vector.scalars.as.objects.true
  , split.cells = c("0%", "20%", "20%", "20%", "40%")
  , split.table = 200
  , justify = "left"
  , caption = "`convertToJava()` behavior for length-one vectors when `length.one.vector.as.array = FALSE` and `scalars.as.objects = TRUE`"
  , emphasize.strong.rows = 1
)

## ----results='asis', echo=FALSE------------------------------------------
# load(rdata.tables)
# Highlight and copy the appropriate section in mapping.xlsx before executing the next line
# r2j.vectors <- mt(9, 4, what = character(), write.to.clipboard = FALSE)
# file.remove(rdata.tables)
# save.image(file = rdata.tables)
pander::pander(
  r2j.vectors
  , split.cells = c("0%", "20%", "20%", "20%", "40%")
  , split.table = 200
  , justify = "left"
  , caption = "`convertToJava()` behavior for vectors, one-dimensional arrays, and one-dimensional tables"
  , emphasize.strong.rows = 1
)

## ----results='asis', echo=FALSE------------------------------------------
# load(rdata.tables)
# Highlight and copy the appropriate section in mapping.xlsx before executing the next line
# r2j.arrays <- mt(9, 4, what = character(), write.to.clipboard = FALSE)
# file.remove(rdata.tables)
# save.image(file = rdata.tables)
pander::pander(
  r2j.arrays
  , split.cells = c("0%", "20%", "20%", "20%", "40%")
  , split.table = 200
  , justify = "left"
  , caption = "`convertToJava()` behavior for n-dimensional arrays and tables"
  , emphasize.strong.rows = 1
)

## ----eval=FALSE----------------------------------------------------------
#  convertToR(
#    value,
#    strings.as.factors = NULL,
#    array.order = "row-major"
#  )

## ----results='asis', echo=FALSE------------------------------------------
# load(rdata.tables)
# Highlight and copy the appropriate section in mapping.xlsx before executing the next line
# j2r.scalars <- mt(12, 4, what = character(), write.to.clipboard = FALSE)
# file.remove(rdata.tables)
# save.image(file = rdata.tables)
pander::pander(
  j2r.scalars
  , split.cells = c("0%", "20%", "20%", "20%", "40%")
  , split.table = 200
  , justify = "left"
  , caption = "`convertToR()` behavior for Java scalars"
  , emphasize.strong.rows = 1
)

## ----results='asis', echo=FALSE------------------------------------------
# load(rdata.tables)
# Highlight and copy the appropriate section in mapping.xlsx before executing the next line
# j2r.arrays <- mt(13, 4, what = character(), write.to.clipboard = FALSE)
# file.remove(rdata.tables)
# save.image(file = rdata.tables)
pander::pander(
  j2r.arrays
  , split.cells = c("0%", "20%", "20%", "20%", "40%")
  , split.table = 200
  , justify = "left"
  , caption = "`convertToR()` behavior for one-dimensional Java arrays and n-dimensional Java arrays"
  , emphasize.strong.rows = 1
)

## ----results='asis', echo=FALSE------------------------------------------
# load(rdata.tables)
# Highlight and copy the appropriate section in mapping.xlsx before executing the next line
# j2r.collections <- mt(10, 4, what = character(), write.to.clipboard = FALSE)
# file.remove(rdata.tables)
# save.image(file = rdata.tables)
pander::pander(
  j2r.collections
  , split.cells = c("0%", "20%", "20%", "20%", "40%")
  , split.table = 200
  , justify = "left"
  , caption = "`convertToR()` behavior for Java objects implementing the `java.util.Collection` interface"
  , emphasize.strong.rows = 1
)

## ------------------------------------------------------------------------
lst <- list(1.1, 2L, as.raw(3))
(o <- convertToJava(lst))
(r <- convertToR(o))
class(r)

## ------------------------------------------------------------------------
lst <- list(1.1, "a")
(o <- convertToJava(lst))
(r <- convertToR(o))
class(r)

## ------------------------------------------------------------------------
lst <- list(c(1, 2), c(3L, 4L))
(o <- convertToJava(lst, array.order = "column-major"))
(r <- convertToR(o, array.order = "column-major"))
class(r)

## ------------------------------------------------------------------------
# This example results in a three-dimensional array.
lst <- list(matrix(1:4, 2, 2), matrix(5:8, 2, 2))
(o <- convertToJava(lst, array.order = "column-major"))
convertToR(o, array.order = "column-major")

## ------------------------------------------------------------------------
lst <- list(list(1))
convertToR(convertToJava(lst))

## ------------------------------------------------------------------------
lst <- list(
  list(field1 = "a", field2 = 1),
  list(field1 = "b", field2 = 2)
)
convertToR(convertToJava(lst))

## ------------------------------------------------------------------------
lst <- list(a = 1.1, b = 2L, c = as.raw(3))
convertToR(convertToJava(lst))

## ------------------------------------------------------------------------
lst <- list(col1 = 1:3, col2 = letters[1:3])
convertToR(convertToJava(lst))

## ------------------------------------------------------------------------
lst <- list(col1 = 1, col2 = "a")
convertToR(convertToJava(lst))
lst <- list(col1 = 1, col2 = "a")
convertToR(convertToJava(lst, length.one.vector.as.array = TRUE))

## ------------------------------------------------------------------------
df <- data.frame(col1 = 1:3)
convertToR(convertToJava(df, data.frame.row.major = FALSE))

