
 library(aster)

 data(radish)

 options(digits=4) # avoid rounding differences

 pred <- c(0,1,2)
 fam <- c(1,3,2)

 rout <- reaster(resp ~ varb + fit : (Site * Region), ~ 0 + fit : Block,
     pred, fam, varb, id, root, data = radish)
 srout1a <- summary(rout)
 srout1b <- summary(rout, stand = FALSE)

 foo <- new.env(parent = emptyenv())
 bar <- suppressWarnings(try(load("reaster1.rda", foo), silent = TRUE))
 if (inherits(bar, "try-error")) {
     save(srout1a, srout1b, file = "reaster1.rda")
 } else {
     srout1a$object$iterations <- NULL
     srout1b$object$iterations <- NULL
     foo$srout1a$object$iterations <- NULL
     foo$srout1b$object$iterations <- NULL
     print(all.equal(srout1a, foo$srout1a, tol = 1e-4))
     print(all.equal(srout1b, foo$srout1b, tol = 1e-4))
 }

