context("\nr6extended") # =================================================================


testclass <-
  R6::R6Class(
    classname = "testclass",
    inherit = r6extended,
    private =
      list(
        find1 = TRUE
      ),
    public = list(
      find2 = TRUE,
      find3 = TRUE,
      hash_do = function(name=NULL){
        private$hash(name)
      }
    )
  )





context("r6extended ls()") # =================================================================

test_that("debug works", {
  expect_true({
    dings <- r6extended$new()
    dings$debug()
    exists("private") & exists("self")
  })
})




context("r6extended ls()") # =================================================================

test_that("ls works", {
  expect_error({
    dings <- r6extended$new()
    dings$ls()
  }, NA)
  expect_error({
    dings <- r6extended$new()
    dings$ls("private")
  }, NA)
  expect_error({
    dings <- r6extended$new()
    dings$ls("self")
  }, NA)
  expect_error({
    dings <- r6extended$new()
    dings$ls("nonsense")
  }, NA)
  expect_true({
    dings <- r6extended$new()
    all(
      dings$ls(class="^function$")$class == "function"
    )
  })
  expect_true({
    dings <- testclass$new()
    is.function(dings$ls)
  })
  expect_error({
    dings <- testclass$new()
    dings$ls()
  },NA)
  expect_true({
    dings <- r6extended$new()
    is.function(dings$ls)
  })
})




context("r6extended message()") # =================================================================

test_that("message works", {
  expect_message({
    dings <- r6extended$new()
    dings$message("tatah")
  })
  expect_message({
    dings <- r6extended$new()
    dings$options$verbose <- FALSE
    dings$message("tatah")
  }, NA)
  expect_true({
    dings <- testclass$new()
    is.function(dings$message)
  })
  expect_message({
    dings <- testclass$new()
    dings$message("")
  },"testclass :")
  expect_true({
    dings <- r6extended$new()
    is.function(dings$message)
  })
  expect_true({
    dings <- r6extended$new()
    a <- 1
    dings$message(a)
    dings$message("1")
    TRUE
  })
})


context("r6extended warning()") # =================================================================

test_that("warning works", {
  expect_warning({
    dings <- r6extended$new()
    dings$warning("tatah")
  })
  expect_warning({
    dings <- r6extended$new()
    dings$options$warning <- FALSE
    dings$warning("tatah")
  }, NA)
  expect_true({
    dings <- testclass$new()
    is.function(dings$warning)
  })
  expect_warning({
    dings <- testclass$new()
    dings$warning("")
  },"testclass :")
  expect_true({
    dings <- r6extended$new()
    is.function(dings$warning)
  })
  expect_true({
    dings <- r6extended$new()
    a <- 1
    suppressWarnings(dings$warning(a))
    suppressWarnings(dings$warning("1"))
    TRUE
  })
})


context("r6extended get()") # =================================================================

test_that("get works", {
  expect_true({
    dings <- r6extended$new()
    is.null(dings$get(""))
  })
  expect_true({
    dings <- r6extended$new()
    !is.null(dings$get("options"))
  })
  expect_error({
    dings <- r6extended$new()
    dings$get("private")
  }, NA)
  expect_error({
    dings <- r6extended$new()
    dings$get("self")
  }, NA)
  expect_true({
    dings <- testclass$new()
    is.function(dings$get)
  })
  expect_true({
    dings <- testclass$new()
    dings$get("find1")
  })
  expect_true({
    dings <- testclass$new()
    dings$get("find2")
  })
  expect_true({
    dings <- testclass$new()
    all(unlist(dings$get(c("find2","find1")))==c(TRUE,TRUE))
  })
  expect_identical({
    dings <- testclass$new()
    names(dings$get(c("find2","find1")))
  }, c("find2","find1"))
  expect_true({
    dings <- r6extended$new()
    is.function(dings$get)
  })
})


context("r6extended hash() hashed() hashes") # =================================================================

test_that("hashing works", {
  expect_error({
    dings <- testclass$new()
    dings$hash_get()
  }, NA)
  expect_true({
    dings <- testclass$new()
    is.null(dings$hash_get(""))
  })
  expect_true({
    dings <- testclass$new()
    dings$hash_get("foob")==dings$hash_get("find")
  })
  expect_true({
    dings <- testclass$new()
    dings$hash_get("find1")==dings$hash_get("find2")
  })
  expect_true({
    dings <- testclass$new()
    hash1 <- dings$hash_get("options")
    dings$options$verbose <- FALSE
    hash2 <- dings$hash_get("options")
    hash1 == hash2
  })
  expect_true({
    dings <- testclass$new()
    hash1 <- dings$hash_get("options")
    dings$options$verbose <- FALSE
    dings$hash_do("options")
    hash2 <- dings$hash_get("options")
    hash1 != hash2
  })
  expect_true({
    dings <- testclass$new()
    hash1 <- dings$hash_get("options")
    dings$options$verbose <- FALSE
    dings$hash_do("options")
    hash2 <- dings$hash_get("options")
    dings$options$verbose <- TRUE
    dings$hash_do("options")
    hash3 <- dings$hash_get("options")
    hash1 == hash3
  })
  expect_error({
    dings <- testclass$new()
    hash1 <- dings$hash_get()
  }, NA)
  expect_true({
    dings <- testclass$new()
    hash2 <- dings$hash_get("find2")
    hash3 <- dings$hash_get("find3")
    dings$find2 <- 1
    dings$find3 <- 1
    hash22 <- dings$hash_get("find2")
    hash32 <- dings$hash_get("find3")
    hash2==hash22 & hash3== hash32
  })
  expect_true({
    dings <- testclass$new()
    hash2 <- dings$hash_get("find2")
    hash3 <- dings$hash_get("find3")
    dings$find2 <- 1
    dings$find3 <- 1
    l <- lapply(c("find2", "find3"),dings$hash_do)
    names(l) <- c("find2", "find3")
    l$find3 != hash3 & l$find2 != hash2
  })
})















