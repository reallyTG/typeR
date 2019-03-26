context("\nrtext_base") # =================================================================
context("rtext_base char_data_get()") # =================================================================

test_that("rtext_base char_data_get() works", {
  expect_error({
    dings <- rtext$new("123")
    dings$char_data_get(0,0)
  }, NA)
  expect_true({
    dings <- rtext$new("123")
    rtext:::dim1(dings$char_data_get())==3
  })
  expect_true({
    text <- "1234567890"
    dings <- rtext$new(text)
    all(
      rtext:::dim1(dings$char_data_get(from = 20))==0,
      rtext:::dim1(dings$char_data_get(to = 0))==0,
      rtext:::dim1(dings$char_data_get(from=2, to = 1))==0,
      rtext:::dim1(dings$char_data_get(from=1, to = 1))==1,
      rtext:::dim1(dings$char_data_get(from=1, to = 1000))==nchar(text),
      rtext:::dim1(dings$char_data_get(from=-100, to = 1))==1,
      rtext:::dim1(dings$char_data_get(from=-100, to = 100))==nchar(text)
    )
  })
  expect_true({
    dings <- rtext$new("123")
    dings$char_data_set("data",1,1)
    res <- names( dings$char_data_get() )
    setequal( res, c("char", "i", "data") )
  })
  expect_true({
    dings <- rtext$new("123")
    dings$char_data_set("data1",1,1)
    dings$char_data_set("data2",1:3,1)
    res <- names( dings$char_data_get() )
    setequal( res, c("char", "i", "data1", "data2") )
  })
})

context("rtext_base char_data_set()") # ========================================================

test_that("rtext_base char_data_set() works", {
  expect_true({
    dings <- rtext$new("123")
    rtext:::dim2(dings$char_data_get())==2
  })
  expect_true({
    dings <- rtext$new("123")
    dings$char_data_set("x1",1)
    rtext:::dim2(dings$char_data_get(x="x1"))==3
  })
  expect_true({
    dings <- rtext$new("123")
    rtext:::dim1(dings$char_data_get(x="x1"))==3
  })
  expect_true({
    dings <- rtext$new("123")
    rtext:::dim2( dings$char_data_get(x=c("x1","x2","x3")) )==5
  })
  expect_error({
    dings <- rtext$new("")
    dings$char_data_get(x=c("x1","x2","x3"))
  }, NA)
  expect_error({
    dings <- rtext$new("123")
    dings$char_data_set("var1", 1, 1:4)
  })
  expect_error({
    dings <- rtext$new("123")
    dings$char_data_set("var1", 1:4, 1)
  })
  expect_error({
    dings <- rtext$new("123")
    dings$char_data_set("var1", 0, 1)
  })
  expect_true({
    dings <- rtext$new("123")
    dings$char_data_set("var1", 1, 1)
    dings$char_data_set("var2", 3, 1)
    res <- dings$char_data_get()
    all(
      dim(res)==c(2,4),
      c("var1", "var2") %in% names(res)
    )
  })
  expect_true({
    dings <- rtext$new("abcdefghijklmnopqrstuvw")
    dings$char_data_set("pimpf", c(1,2,6,7) , 1)
    dings$char_data_set("pompf", c(1:4,7:10), 1)
    all(
      dings$char_data_get()==
        structure(list( i = c(1, 2, 3, 4, 6, 7, 8, 9, 10), char = c("a", "b", "c", "d", "f", "g", "h", "i",  "j"), pimpf = c(1, 1, NA,  NA, 1, 1, NA, NA, NA), pompf = c(1, 1, 1, 1, NA, 1, 1, 1, 1)), .Names = c("i","char", "pimpf", "pompf"), row.names = c(NA, 9L), class = "data.frame"),
      na.rm = TRUE
    )
  })
})

test_that("rtext_base code updates on char_delete", {
  expect_true({
    dings <- rtext$new("123")
    dings$char_get()
    dings$char_data_set("var1", 1, 1)
    dings$char_data_get()
    dings$char_delete(1, from = 1)
    identical(
      dim(dings$char_data_get()),
      dim(subset(data.frame(i=1, char="",var1=1), FALSE))
    )
  })
  expect_true({
    dings <- rtext$new("123")
    dings$char_data_set("var1", 3, 1)

    dings$char_data_get()
    dings$char_get()

    dings$char_delete(1, from = 1)
    identical(
      as.character(dings$char_data_get()),
      as.character(hellno::data.frame( i=2, char="3", var1=1))
    )
  })
})

test_that("rtext_base code updates on char_add", {
  expect_true({
    dings <- rtext$new("123")
    dings$char_data_set("var1", 1, 1)
    dings$char_add("a",0)
    dings$char_get()
    identical(
      dings$char_data_get(),
      hellno::data.frame(i=2L, char="1", var1=1)
    )
  })
})

test_that("rtext_base code updates on char_replace", {
  expect_true({
    dings <- rtext$new("abcdefg")
    dings$char_data_set("var1", 3, 1)
    dings$char_replace(from=2,to=6,by="/")
    dings$char_get()
    identical(
      dings$char_data_get(),
      subset(hellno::data.frame(i=1L, char="", var1=1), FALSE)
    )
  })
  expect_true({
    dings <- rtext$new("123")
    dings$char_data_set("var1", 1, 1)
    dings$char_replace(1,1,"a")
    dings$char_get()
    identical(
      dings$char_data_get(),
      subset(hellno::data.frame(i=1L, char="", var1=1), FALSE)
    )
  })
  expect_true({
    dings <- rtext$new("123")
    dings$char_data_set("var1", 3, 1)
    dings$char_replace(1,2,"")
    dings$char_get()
    dings$char_data_get()
    identical(
      unlist(dings$char_data_get(), use.names = FALSE),
      c(1,"3",1)
    )
  })
})














context("rtext_base hash") # ========================================================
test_that("rtext_base data_hash does not change on char manipulation", {
  expect_true({
    dings <- rtext$new(text="1234567890")
    hash1 <- dings$hash_get("data")
    hash2 <- dings$hash_get("data")
    dings$char_add("a")
    hash3 <- dings$hash_get("data")
    dings$char_delete(1)
    hash4 <- dings$hash_get("data")
    all.equal(hash1, hash2, hash3, hash4)
  })
})
test_that("rtext_base text_hash does not change on subsequent calls", {
  expect_true({
    dings <- rtext$new(text="1234567890")
    hash1 <- dings$hash_get("char")
    char1 <- dings$char_get(raw=TRUE)
    dings$char_add("")
    hash2 <- dings$hash_get("char")
    char2 <- dings$char_get(raw=TRUE)
    hash1 == hash2
  })
})
test_that("rtext_base text_hash does change on char manipulation", {
  expect_true({
    dings <- rtext$new(text="1234567890")
    hash1 <- dings$hash_get("char")
    char1 <- dings$char_get(raw=TRUE)
    dings$char_add("a")
    hash2 <- dings$hash_get("char")
    dings$char_delete(1)
    char3 <- dings$char_get(raw=TRUE)
    hash3 <- dings$hash_get("char")
    hash1 != hash2 & hash2 != hash3 & hash3 == hash1
  })
})


test_that("rtext_base hash_text works", {
  expect_true({
    dings <- rtext$new(paste0(sample(letters, 100, replace = TRUE), collapse = ""))
    hash1 <- dings$hash_get("char")
    hash2 <- dings$hash_get("char")
    hash1 == hash2
  })
  expect_true({
    dings <- rtext$new(text="----")
    hash1 <- dings$hash_get("char")
    dings$char_add("/")
    hash2 <- dings$hash_get("char")
    hash1 != hash2
  })
  expect_true({
    dings <- rtext$new(text="----")
    hash1 <- dings$hash_get("char")
    dings$char_add("")
    hash2 <- dings$hash_get("char")
    hash1 == hash2
  })
  expect_true({
    dings <- rtext$new(text="----")
    hash1 <- dings$hash_get("char")
    dings$char_delete()
    hash2 <- dings$hash_get("char")
    hash1 == hash2
  })
  expect_true({
    dings <- rtext$new(text="----")
    hash1 <- dings$hash_get("char")
    dings$char_delete(1)
    hash2 <- dings$hash_get("char")
    hash1 != hash2
  })
  expect_true({
    dings <- rtext$new(text="----")
    hash1 <- dings$hash_get("char")
    dings$char_delete(from = 1)
    hash2 <- dings$hash_get("char")
    hash1 != hash2
  })
  expect_true({
    dings <- rtext$new(text="----")
    hash1 <- dings$hash_get("char")
    dings$char_delete(to = 1)
    hash2 <- dings$hash_get("char")
    hash1 != hash2
  })
  expect_true({
    dings <- rtext$new(text="----")
    hash1 <- dings$hash_get("char")
    dings$char_delete(from = 1, to = 1)
    hash2 <- dings$hash_get("char")
    hash1 != hash2
  })
})


context("rtext_base text_get") # ====================================================
test_that("get_text works also with junk input", {
  expect_true( # general
    all(
      rtext$new(text="1234567890")$text_get(length = 1          )=="1",
      rtext$new(text="1234567890")$text_get(length = 1, to   = 1)=="1",
      rtext$new(text="1234567890")$text_get(length = 1, from = 1)=="1"
    )
  )
  expect_true( # length
    all(
      rtext$new(text="1234567890")$text_get(length =  0)=="",
      rtext$new(text="1234567890")$text_get(length = -1)=="",
      rtext$new(text="1234567890")$text_get(length = 11)=="1234567890"
    )
  )
  expect_true( # length + from
    all(
      rtext$new(text="1234567890")$text_get(from =   0, length =  0)=="",
      rtext$new(text="1234567890")$text_get(from =  10, length = -1)=="",
      rtext$new(text="1234567890")$text_get(from = -10, length = 10)=="",
      rtext$new(text="1234567890")$text_get(from =  -1, length = 3)=="1",
      rtext$new(text="1234567890")$text_get(from =  11, length =  1)=="",
      rtext$new(text="1234567890")$text_get(from =   1, length =  3)=="123"
    )

  )
  expect_true( # length + to
    all(
      rtext$new(text="1234567890")$text_get(length =  1, to = 11)=="",
      rtext$new(text="1234567890")$text_get(length =  1, to = 10)=="0",
      rtext$new(text="1234567890")$text_get(length =  1, to = -1)=="",
      rtext$new(text="1234567890")$text_get(length = -1, to = -1)=="",
      rtext$new(text="1234567890")$text_get(length = -1, to =  3)=="",
      rtext$new(text="1234567890")$text_get(length =  3, to =  3)=="123"
    )
  )
  expect_true( # from + to
    all(
      rtext$new(text="1234567890")$text_get(from = 2, to =  2)=="2",
      rtext$new(text="1234567890")$text_get(from = 2, to =  1)=="21",
      rtext$new(text="1234567890")$text_get(from = 0, to =  2)=="12",
      rtext$new(text="1234567890")$text_get(from = 9, to = 22)=="90"
    )
  )
  expect_true( # from + to
    all(
      rtext$new(text="1234567890")$text_get(from = 9, to = 22, split="")==c("9","0"),
      rtext$new(text="1\n2")$text_get(split="\n")==c("1","2")
    )
  )
  expect_true(
    rtext$new(text="12345")$char_delete(n = 1)$text_get() != "NANANANA"
  )
})



context("rtext_base char_add") # ====================================================
test_that("rtext_base add", {
  expect_true( rtext$new(text="----")$char_add("///"   )$text_get()=="----///" )
  expect_true( rtext$new(text="----")$char_add("///", 0)$text_get()=="///----" )
  expect_true( rtext$new(text="----")$char_add("///", 2)$text_get()=="--///--" )
  expect_true( rtext$new(text="----")$char_add("/")$char_add("/")$text_get()=="----//" )
  expect_true( rtext$new(text="----")$char_add("ä", Inf)$text_get()=="----ä" )
})


context("rtext_base char_replace") # ================================================
test_that("rtext_base add", {
  expect_true( rtext$new(text="12345")$char_replace(1,1,"///" )$text_get()=="///2345" )
  expect_true( rtext$new(text="12345")$char_replace(5,5,"///" )$text_get()=="1234///" )
  expect_true( rtext$new(text="12345")$char_replace(3,3,"///" )$text_get()=="12///45" )
  expect_true( rtext$new(text="12345")$char_replace(1,5,"///" )$text_get()=="///"     )
  expect_true( rtext$new(text="12345")$char_replace(0,9,"///" )$text_get()=="///"     )
  expect_true( rtext$new(text="12345")$char_replace(0,0,"///" )$text_get()=="///12345")
  expect_true( rtext$new(text="12345")$char_replace(0,0,"ä" )$text_get()=="ä12345")
})



context("rtext_base char_delete") # =================================================
test_that("rtext_base char_delete", {
  expect_true( rtext$new(text="12345")$char_delete(from= 1)$text_get()=="")
  expect_true( rtext$new(text="12345")$char_delete(from=-2)$text_get()=="")
  expect_true( rtext$new(text="12345")$char_delete(from= 3)$text_get()=="12")
  expect_true( rtext$new(text="12345")$char_delete(from= 9)$text_get()=="12345")

  expect_true( rtext$new(text="12345")$char_delete(to= 1)$text_get()=="2345")
  expect_true( rtext$new(text="12345")$char_delete(to= 3)$text_get()=="45")
  expect_true( rtext$new(text="12345")$char_delete(to= 9)$text_get()=="")
  expect_true( rtext$new(text="12345")$char_delete(to=-9)$text_get()=="12345")

  expect_true( rtext$new(text="12345")$char_delete(n = 1, from = 1)$text_get()=="2345")
  expect_true( rtext$new(text="12345")$char_delete(n = 4, from = 3)$text_get()=="12")
  expect_true( rtext$new(text="12345")$char_delete(n = 0, from = 1)$text_get()=="12345")
  expect_true( rtext$new(text="12345")$char_delete(n = 5, from = -2)$text_get()=="345")

  expect_true( rtext$new(text="12345")$char_delete(n = 0, to   = 1)$text_get()=="12345")
  expect_true( rtext$new(text="12345")$char_delete(n = 1, to   = 1)$text_get()=="2345")
  expect_true( rtext$new(text="12345")$char_delete(n = 9, to   = 1)$text_get()=="2345")
  expect_true( rtext$new(text="12345")$char_delete(n = 1, to   = 9)$text_get()=="12345")
  expect_true( rtext$new(text="12345")$char_delete(n = 2, to   = 6)$text_get()=="1234")

  expect_true( rtext$new(text="12345")$char_delete(from = 2, to = 3)$text_get()=="145")
  expect_true( rtext$new(text="12345")$char_delete(from = -2, to = 3)$text_get()=="45")
  expect_true( rtext$new(text="12345")$char_delete(from =  2, to = 30)$text_get()=="1")
  expect_true( rtext$new(text="12345")$char_delete(from =  1, to = 5)$text_get()=="")
  expect_true( rtext$new(text="12345")$char_delete(from =  4, to = 4)$text_get()=="1235")
  expect_true( rtext$new(text="12345")$char_delete(from =  5, to = 4)$text_get()=="12345")

  expect_true(
    rtext$new(text="12345")$char_delete(n = 0, to   = 5)$text_get()==
      rtext$new(text="12345")$char_delete(0)$text_get()
  )
  expect_true(
    rtext$new(text="12345")$char_delete(n = 3, to   = 5)$text_get()==
      rtext$new(text="12345")$char_delete(3)$text_get()
  )
})



context("rtext_base init") # ========================================================
test_that("rtext_base initialization", {
  expect_error( rtext$new(), NA)
  expect_error( rtext$new(NULL), NA)
  expect_error( rtext$new(""), NA)
  expect_error( rtext$new(text_file=testfile("rc_1_ch1.txt")), NA)
  expect_error( rtext$new(text="", text_file=testfile("rc_1_ch1.txt")), NA)
  expect_error( rtext$new(text=readLines(testfile("rc_1_ch1.txt"))), NA)
  expect_true({
    !is.null(rtext$new("")$id)
  })
  expect_true({
    identical(rtext$new("", id="mänämüdderschnüdetspück")$id, "mänämüdderschnüdetspück")
  })
  expect_true({
    all(
      nchar(
        rtext$new(text_file=testfile("test_init1.txt"))$char_get()
      )==1
    )
  })
})


context("rtext_base char_data_set() with levels") # =================================================================

test_that("rtext_base char_data_get() with levels works", {
  expect_true({
    dings <- rtext$new("1234567890")
    dings$char_data_set("data", 5:7, "val1", hl=0)
    dings$char_data_set("data", 5:7, "val2", hl=-1)
    all(
      dings$char_data_get()$data == c("val1", "val1", "val1")
    )
  })
  expect_true({
    dings <- rtext$new("1234567890")
    dings$char_data_set("data", 5:7, "val1", hl=0)
    dings$char_data_set("data", 5:7, "val2", hl=1)
    all(
      dings$char_data_get()$data == c("val2", "val2", "val2")
    )
  })
  expect_true({
    dings <- rtext$new("1234567890")
    dings$char_data_set("data", 5:7, "val1", hl=0)
    dings$char_data_set("data", 4:8, "val2", hl=1)
    all(
      dings$char_data_get()$data == c("val2", "val2", "val2", "val2", "val2")
    )
  })
  expect_true({
    dings <- rtext$new("1234567890")
    dings$char_data_set("data", 1:5, "val5", hl=5)
    dings$char_data_set("data", 1:5, "val4", hl=4)
    dings$char_data_set("data", 1:5, "val3", hl=3)
    dings$char_data_set("data", 1:5, "val2", hl=2)
    dings$char_data_set("data", 1:5, "val1", hl=1)
    all(
      dings$char_data_get()$data == c("val5", "val5", "val5", "val5", "val5")
    )
  })
  expect_true({
    dings <- rtext$new("1234567890")
    dings$char_data_set("data", 1:5, "val5", hl=1:5)
    dings$char_data_set("data", 4:5, "val4", hl=4)
    dings$char_data_set("data", 3:5, "val3", hl=3)
    dings$char_data_set("data", 2:5, "val2", hl=2)
    dings$char_data_set("data", 1:5, "val1", hl=1)
    all(
      dings$char_data_get()$data == c("val1", "val2", "val3", "val4", "val5")
    )
  })
})


context("rtext_base tokenize_data_regex") # =================================================================
test_that("rtext_base tokenize_data_regex", {
  expect_true({
    dings <- rtext$new("text toxt tuxt tack tock tick boom")
    dings$char_data_set_regex("empteyh", " ", 1)
    all(dings$char_data_get()$empteyh == 1)
  }, NA)
  expect_true({
    dings <- rtext$new("text toxt tuxt tack tock tick boom")
    dings$char_data_set_regex("empteyh", " ", 1, hl=2)
    dings$char_data_set_regex("empteyh", " ", 2)
    all(dings$char_data_get()$empteyh == 1)
  }, NA)
  expect_true({
    dings <- rtext$new("text toxt tuxt tack tock tick boom")
    dings$char_data_set_regex("empteyh", " ", 1, hl=-1)
    dings$char_data_set_regex("empteyh", " ", 2)
    all(dings$char_data_get()$empteyh == 2)
  }, NA)
  expect_true({
    dings <- rtext$new("text toxt tuxt tack tock tick boom")
    dings$char_data_set_regex("first", "^\\w+")
    all(dings$char_data_get()$char==c("t","e","x","t"))
  }, NA)
  expect_true({
    dings <- rtext$new("text toxt tuxt tack tock tick boom")
    dings$char_data_set_regex("first", "\\w+$", hl=500)
    all(dings$char_data_get()$char==c("b","o","o","m"))
  }, NA)
  expect_true({
    dings <- rtext$new("text toxt tuxt tack tock tick boom")
    dings$char_data_set_regex("first", "Boom", ignore.case=TRUE)
    all(dings$char_data_get()$char==c("b","o","o","m"))
  }, NA)
  expect_true({
    dings <- rtext$new("text toxt tuxt tack tock tick boom")
    dings$char_data_set_regex(x="first", pattern="berserker")
    identical(dings$char_data_get("first"), data.frame())
  })
})



context("rtext_base text_get_lines()") # =================================================================

test_that("rtext_base text_get_lines() works", {
  expect_true({
    dings <- rtext$new(text_file=testfile("rc_1_ch1.txt"))
    all(dim(dings$text_get_lines()) == c(424, 5))
  }, NA)
  expect_true({
    dings <- rtext$new("ulahlala uhlala tzzz tzzz tzzz")
    !is.na(dings$text_get_lines()$n) &
      !is.na(dings$text_get_lines()$text)
  })
})



















