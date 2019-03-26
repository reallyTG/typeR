library(RJSONIO)


### Name: toJSON
### Title: Convert an R object to a string in Javascript Object Notation
### Aliases: toJSON toJSON,list-method toJSON,ANY-method
###   toJSON,numeric-method toJSON,integer-method
###   toJSON,integer,missing-method toJSON,character-method
###   toJSON,logical-method toJSON,hexmode-method toJSON,matrix-method
###   toJSON,ANY-method toJSON,name-method toJSON,list-method
###   toJSON,NULL-method toJSON,factor-method toJSON,AsIs-method
###   toJSON,environment-method toJSON,data.frame-method
###   toJSON,array-method toJSON,function-method emptyNamedList
### Keywords: IO programming

### ** Examples

 toJSON(1:10)
 toJSON(rnorm(3))
 toJSON(rnorm(3), digits = 4)

 toJSON(c("Duncan", "Temple Lang"))

 toJSON(c(FALSE, FALSE, TRUE))

   # List of elements
 toJSON(list(1L, c("a", "b"), c(FALSE, FALSE, TRUE), rnorm(3)))
   # with digits controlling formatting of sub-elements
 toJSON(list(1L, c("a", "b"), c(FALSE, FALSE, TRUE), rnorm(3)),
          digits = 10)

   # nested lists
 toJSON(list(1L, c("a", "b"), list(c(FALSE, FALSE, TRUE), rnorm(3))))

   # with names
 toJSON(list(a = 1L, c("a", "b"), c(FALSE, FALSE, TRUE), rnorm(3)))

 setClass("TEMP", representation(a = "integer", xyz = "logical"))
 setClass("TEMP1", representation(one = "integer", two = "TEMP"))

 new("TEMP1", one = 1:10, two = new("TEMP", a = 4L, xyz = c(TRUE, FALSE)))


 toJSON(list())
 toJSON(emptyNamedList)
 toJSON(I(list("hi")))
 toJSON(I("hi"))


 x = list(list(),
          emptyNamedList,
          I(list("hi")),
          "hi",
          I("hi"))
 toJSON(x)

  # examples of specifying .withNames
 toJSON(structure(1:3, names = letters[1:3]))
 toJSON(structure(1:3, names = letters[1:3]), .withNames = FALSE)


  # Controlling NAs and mapping them to whatever we want.
 toJSON(c(1L, 2L, NA), .na = "null")
 toJSON(c(1L, 2L, NA), .na = -9999)

 toJSON(c(1, 2, pi, NA), .na = "null")

 toJSON(c(TRUE, FALSE, NA), .na = "null")

 toJSON(c("A", "BCD", NA), .na = "null")

 toJSON( factor(c("A", "B", "A", NA, "A")), .na = "null" )

 toJSON(list(TRUE, list(1, NA), NA), .na = "null")



 setClass("Foo", representation(a = "integer", b = "character"))
 obj = new("Foo", a = c(1L, 2L, NA, 4L), b = c("abc", NA, "def"))
 toJSON(obj)
 toJSON(obj, .na = "null")

  # hexmode example with .na ?

 toJSON(matrix(c(1, 2, NA, 4), 2, 2), .na = "null")
 toJSON(matrix(c(1, 2, NA, 4), 2, 2), .na = -9999999)


 x = '"foo\tbar\n\tagain"'
 cat(toJSON(x))
 cat(toJSON(list(x)))

  # if we want to expand the new lines and tab characters
 cat(toJSON(x), .escapeEscapes = FALSE)


  # illustration of the asIs argument
  cat(toJSON(list(a = 1, b = 2L, c = TRUE,
                  d = c(1, 3),
                  e = "abc"), asIs = TRUE))

  cat(toJSON(list(a = 1, b = 2L, c = TRUE,
                  d = c(1, 3),
                  e = "abc"), asIs = FALSE))

   # extra level
  cat(toJSON(list(a = c(x = 1), b = 2L, c = TRUE,
                  d = list(1, 3),
                  e = "abc"), asIs = FALSE, pretty = TRUE))


   # data frame by row as arrays
  twoRows = data.frame(a = 1:2, b = as.numeric(1:2))
  j = toJSON(twoRows, byrow = TRUE)
  r = data.frame(do.call(rbind, fromJSON(j)))

   # here we keep the names of the columns on each row
   # which allows us to round-trip the object back to R
  j = toJSON(twoRows, byrow = TRUE, colNames = TRUE)
  r = data.frame(do.call(rbind, fromJSON(j)))



