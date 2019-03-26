#### tools =====================================================================
context("\ntools") # ===========================================================



context("tools plot.rtext")

test_that("tools plot.rtext", {
  expect_error({
    text <- "meine mudder schneidet speck"
    dings <- rtext$new(text)
    plot(dings)
  }, NA)
  expect_error({
    text <- "meine\n mudder \nschneidet speck\n"
    dings <- rtext$new(text)
    plot(dings)
  },NA)
  expect_error({
    text  <- "meine\n mudder \nschneidet speck\n"
    dings <- rtext$new(text)
    dings$char_data_set_regex("digger", "\\w+", TRUE)
    dings$char_data_get()
    plot(dings, "digger")
  },NA)
})




context("tools tokenize_text")

test_that("tools tokenize text", {

  text <- "meine mudder schneidet speck"
  dings <- rtext$new(text)

  expect_error({
      text_tokenize(dings)
  })
  expect_true({
    rtext:::dim1(text_tokenize(dings, "")) == nchar(text)
  })
  expect_true({
    identical(
      text_tokenize(dings, ""),
      text_tokenize(dings$text_get(), "")
    )
  })
  expect_true({
    identical(
      text_tokenize(dings, "\\W+"),
      text_tokenize(dings$text_get(), "\\W+")
    )
  })
  expect_true({
    identical(
      text_tokenize(dings, "M", ignore.case = TRUE),
      text_tokenize(dings, "m", ignore.case = FALSE)
    )
  })
})



context("tools classes")

test_that("classes works", {
  expect_true({
    all(rtext:::classes(hellno::data.frame(1,""))$class==c("numeric", "character"))
  })
})


context("tools dp_arrange")

test_that("dp_arrange works", {
  expect_identical({
    rtext:::dp_arrange(data.frame(i=10:9))
  }, data.frame(i=10:9))
  expect_identical({
    rtext:::dp_arrange(data.frame(i=10:9), i)
  }, data.frame(i=9:10))
  expect_identical(
    {
      rtext:::dp_arrange(data.frame(i=10:9, b=1), i)
    },
    {
      x <- data.frame(i=9:10, b=1)
      row.names(x) <- 2:1
      x
    }
  )
})


context("tools dim1 dim2 seq_dim1")

test_that("dim1 dim2 seq_dim1 works", {
  expect_error({
    rtext:::dim1()
  })
  expect_true({
    rtext:::dim1(1)==1
  })
  expect_true({
    is.null(rtext:::dim2(1))
  })
  expect_true({
    all(
      rtext:::dim2(data.frame())==0,
      rtext:::dim1(data.frame())==0
    )
  })
  expect_true({
    all(
      rtext:::dim2(data.frame(1:10))==1,
      rtext:::dim1(data.frame(1:10))==10
    )
  })
  expect_true({
    all(
      length(rtext:::seq_dim1(data.frame(4:5)))==2,
      length(rtext:::seq_dim1(4:5)) ==2
    )
  })
})


context("tools is_between")

test_that("is_between works", {
  expect_true({
    !rtext:::is_between(1,2,3)
  })
  expect_true({
    rtext:::is_between(2,2,3)
  })
  expect_true({
    rtext:::is_between(3,2,3)
  })
  expect_true({
    rtext:::is_between(-1,-2,3)
  })
  expect_true({
    is.na(rtext:::is_between(NA,-2,3))
  })
})

context("tools rbind_fill")

test_that("rbind_fill works", {
  expect_true({
    df1 <- data.frame(x=1)
    df2 <- data.frame(x=1)
    all(
      dim(rtext:::rbind_fill(df1, df2))==c(2,1)
    )
  })
  expect_true({
    df1 <- data.frame(x=1)
    df2 <- data.frame(y=1)
    all(
      dim(rtext:::rbind_fill(df1, df2))==c(2,2)
    )
  })
  expect_true({
    df1 <- data.frame()
    df2 <- data.frame(y=1)
    all(
      dim(
        rtext:::rbind_fill(df1, df2)
        )==c(1,1)
    )
  })
  expect_true({
    df1 <- data.frame(x=1)
    df2 <- data.frame()
    all(
      dim(
        rtext:::rbind_fill(df1, df2)
      )==c(1,1)
    )
  })
  expect_true({
    df1 <- data.frame()
    df2 <- data.frame()
    all(
      dim(
        rtext:::rbind_fill(df1, df2)
      )==c(0,0)
    )
  })
})


context("tools shift")

test_that("shift works", {
  expect_true({
    x <- 1:3
    all(
      rtext:::shift(x) == x
    )
  })
  expect_true({
    x <- 1:3
    all(
      rtext:::shift(x) == x,
      identical(rtext:::shift(x,1), c(NA,1L,2L)),
      identical(rtext:::shift(x,"forward"), c(NA,1L,2L)),
      identical(rtext:::shift(x,"lag"), c(NA,1L,2L)),
      identical(rtext:::shift(x,"right"), c(NA,1L,2L))
    )
  })
  expect_true({
    x <- 1:3
    all(
      identical(rtext:::shift(x,-1), c(2L, 3L, NA)),
      identical(rtext:::shift(x,"backward"), c(2L, 3L, NA)),
      identical(rtext:::shift(x,"lead"), c(2L, 3L, NA)),
      identical(rtext:::shift(x,"left"), c(2L, 3L, NA))
    )
  })
  expect_true({
    x <- 1:3
    all(
      identical(rtext:::shift(x, 1,  invert=TRUE), c(2L, 3L, NA) ),
      identical(rtext:::shift(x, -1, invert=TRUE), c(NA,1L,2L)   )
    )
  })
  expect_true({
    x <- 1:3
    all(
      all(is.na(rtext:::shift(x, 3))),
      length(is.na(rtext:::shift(x, 3)))==3,
      all(is.na(rtext:::shift(x, 5))),
      length(is.na(rtext:::shift(x, 5)))==3,
      all(is.na(rtext:::shift(x, -5))),
      length(is.na(rtext:::shift(x, -5)))==3,
      all(is.na(rtext:::shift(x, -3))),
      length(is.na(rtext:::shift(x, -3)))==3
    )
  })
})



context("tools load_into")

test_that("load_into works", {
  expect_true({
    a <- list(a=1:10, b="a")
    tmp <- tempfile()
    save(a, file=tmp)
    b <- rtext:::load_into(tmp)[[1]]
    attr(b, "class") <- NULL
    identical(a,b)
  })
})


context("tools testfile")

test_that("testfile works", {
  expect_true({
    all(
      class(testfile())=="character",
      length(testfile())>=9
    )
  })
  expect_true({
    all(
      file.exists(testfile(full.names = TRUE))
    )
  })
  expect_true({
    all(
      file.exists(testfile(1, full.names = TRUE))
    )
  })
  expect_true({
    all(
      file.exists(testfile(pattern = "test", full.names = TRUE))
    )
  })
  expect_true({
    all(
      class(testfile(""))=="character",
      length(testfile(""))>=9
    )
  })
  expect_true({
    all(
      file.exists(testfile("",full.names = TRUE))
    )
  })
  expect_true({
    all(
      file.exists(testfile("", pattern = "test", full.names = TRUE))
    )
  })
})





context("tools modus")

test_that("easy examples work properly", {
  expect_true(  modus(1)==1 )
  expect_true(  modus(2)==2 )
  expect_true(  modus(1:10, warn = FALSE) == 1 )
  expect_true(  modus(10:1, warn = FALSE) ==10 )
  expect_warning( modus(c(1,1,2,2)) )
  expect_true(  all(rtext:::modus(c(1,1,2,3,2), multimodal=TRUE)==c(1,2)) )
  expect_warning(  all(rtext:::modus(c(1,1,2,3,2), multimodal=TRUE)==c(1,2)),NA )
}
)



context("tools which_token()")

test_that("easy examples work properly", {
  expect_true(
    which_token( x =        1, y1 =        1, y2 =           1 )  ==        1
  )
  expect_true(
    which_token( x =        2, y1 =   c(2,1), y2 =      c(2,1) )  ==        1
  )
  expect_true(
    which_token( x =        1, y1 =   c(2,1), y2 =      c(2,1) )  ==        2
  )
  expect_equal(
    which_token( x =      1:2, y1 =   c(2,1), y2 =      c(2,1) ),      c(2,1)
  )
  expect_equal(
    which_token( x = c(7,2,4), y1 = c(1,3,7), y2 = c(2,6,2000) ),    c(3,1,2)
  )
  expect_equal( which_token( x =      1:4, y1 = c(1,3,7), y2 = c(2,6,2000) ), c(1,1,2,2))
  expect_true(  is.na(which_token( x =     2001, y1 = c(1,3,7), y2 = c(2,6,2000) ))       )
}
)


context("tools get_vector_element()")

test_that("tools get_vector_element() works", {
  x <- 1L:10L
  a <- letters[1:10]
  expect_identical( get_vector_element(a,1), a[1])
  expect_identical( get_vector_element(a,2), a[1:2])
  expect_identical( get_vector_element(a,2,3), a[3:4])
  expect_identical(
    get_vector_element(a,2,3),
    a[3:4]
  )
  expect_identical(
    get_vector_element(a,2,3,7),
    a[3:7]
  )
  expect_identical(
    get_vector_element(a,2,7,3),
    a[7:3]
  )
  expect_identical(
    get_vector_element(a,from=3,to=3),
    a[3:3]
  )
  expect_identical(
    get_vector_element(a,from=0,to=10),
    a
  )
  expect_error(
    get_vector_element(a)
  )
  expect_identical(
    get_vector_element(a, length=1, from = 4),
    a[4]
  )
  expect_identical(
    get_vector_element(a, length=1, to = 4),
    a[4]
  )
})




context("tools vector_delete()")

test_that("vector_delete works with only n as argument", {
  x <- 1L:10L
  a <- letters[1:10]
  expect_identical( vector_delete(x), x  )
  expect_identical( vector_delete(a), a  )
  expect_identical( vector_delete(a,10),character(0) )
  expect_identical( vector_delete(x,10),integer(0) )
  expect_identical( vector_delete(x, 5) , x[1:5] )
  expect_identical( vector_delete(a, 5) , a[1:5] )
})

test_that("vector_delete works with various arguments", {
  x <- unlist(strsplit("12345",""))
  expect_true( text_collapse(vector_delete(x, from= 1          ))=="")
  expect_true( text_collapse(vector_delete(x, from=-2          ))=="")
  expect_true( text_collapse(vector_delete(x, from= 3          ))=="12")
  expect_true( text_collapse(vector_delete(x, from= 9          ))=="12345")
  expect_true( text_collapse(vector_delete(x, to= 3            ))=="45")
  expect_true( text_collapse(vector_delete(x, to= 9            ))=="")
  expect_true( text_collapse(vector_delete(x, to=-9            ))=="12345")
  expect_true( text_collapse(vector_delete(x, to= 1            ))=="2345")
  expect_true( text_collapse(vector_delete(x, n = 1, from   =  1))=="2345")
  expect_true( text_collapse(vector_delete(x, n = 4, from   =  3))=="12")
  expect_true( text_collapse(vector_delete(x, n = 0, from   =  1))=="12345")
  expect_true( text_collapse(vector_delete(x, n = 5, from   = -2))=="345")
  expect_true( text_collapse(vector_delete(x, n = 0, to     =  1))=="12345")
  expect_true( text_collapse(vector_delete(x, n = 1, to     =  1))=="2345")
  expect_true( text_collapse(vector_delete(x, n = 9, to     =  1))=="2345")
  expect_true( text_collapse(vector_delete(x, n = 1, to     =  9))=="12345")
  expect_true( text_collapse(vector_delete(x, n = 2, to     =  6))=="1234")
  expect_true( text_collapse(vector_delete(x, from = 2, to  =  3))=="145")
  expect_true( text_collapse(vector_delete(x, from = -2, to =  3))=="45")
  expect_true( text_collapse(vector_delete(x, from =  2, to = 30))=="1")
  expect_true( text_collapse(vector_delete(x, from =  1, to =  5))=="")
  expect_true( text_collapse(vector_delete(x, from =  4, to =  4))=="1235")
  expect_true( text_collapse(vector_delete(x, from =  5, to =  4))=="12345")

  expect_true(
    rtext$new(text="12345")$char_delete(n = 0, to   = 5)$text_get()==
      rtext$new(text="12345")$char_delete(0)$text_get()
  )
  expect_true(
    rtext$new(text="12345")$char_delete(n = 3, to   = 5)$text_get()==
      rtext$new(text="12345")$char_delete(3)$text_get()
  )
})


