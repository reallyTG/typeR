context("test-flow-right")

## test right side of flow chart
## consider the 'r' variable
intent <- c("r", "w")
tg <- expand.grid(signature = c("int", "double", "int64"),
            type = c("int", "double"),
            referenced = c("ref", "notRef"),
            stringsAsFactors = FALSE)

for(i in 1:nrow(tg)){
test_that(paste0("right-", paste0(tg[i,], collapse = "-")), {
    signature <- tg[i, "signature"]
    type <- tg[i, "type"]
    referenced <- if(tg[i, "referenced"] == "ref") TRUE else FALSE
    info <- paste0("signature:", signature,
                   ", type:", type, ", i:", i)

    a <- switch(type,
                int = 5L,
                double = 7.6,
                int64 = 2^32)

    if(referenced){
       b <- switch(type,
                   int = 1L,
                   double = 1.0,
                   int64 = 1.0)
    } else
       b <- switch(type,
                    int = integer_dc(1),
                    double = numeric_dc(1),
                    int64 = numeric_dc(1))
      
    expr <- expression(
          .C64(paste0("TEST_times2_", signature),
               c(signature, signature),
               a = a,
               r = b,
               INTENT = intent,
               PACKAGE = "dotCall64",
               VERBOSE = 1))

    dc <- suppressWarnings(eval(expr))
    a_out <- if(signature %in% c("int", "int64")) as.integer(a) else a
    r_out <- 2L * a_out
    ## currently returned objects are of type "signature"
    r_out <- if(signature == "int") as.integer(r_out) else as.double(r_out)
    dc_e <- list(a = NULL, r =  r_out)
    expect_equal(dc, dc_e,
                 info = info)
    expect_equal(typeof(dc$r), typeof(dc_e$r),
                 info = info)

    ## test for corrupted R objects
    expect_identical(a, switch(type,
                               int = 5L,
                               double = 7.6,
                               int64 = 2^32),
                     label = "[corrupt R object]",
                     info = info)
 
    if(referenced)
      expect_identical(b, switch(type,
                                 int = 1L,
                                 double = 1.0,
                                 int64 = 1.0),
                      label = "[corrupt R object]",
                      info = info)


    ## test warnings
    if(referenced){
      expect_warning(eval(expr),
                     "[dotCall64|referenced R object]",
                     label = "[dotCall64|referenced R object]",
                     info = info)
    } else {
      ## expect_that(eval(expr),
      ##             not(gives_warning("[dotCall64|referenced R object]")),
      ##             label = "[dotCall64|referenced R object]",
      ##             info = info)
    }


    if(signature != type && !(signature == "int64" && type == "double")) {
       expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                      info = info,
                      label = "[dotCall64|wrong R object type]")
   } else {
       ## expect_that(eval(expr),
       ##             not(gives_warning("[dotCall64|wrong R object type]")),
       ##             info = info)
   }
})
}

