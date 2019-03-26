
 library(aster)

 set.seed(42)

 nind <- 25

 vars <- c("l2", "l3", "f2", "f3", "h2", "h3")
 pred <- c(0, 1, 1, 2, 3, 4)
 fam <- c(1, 1, 1, 1, 3, 3)
 length(pred) == length(fam)
 nnode <- length(pred)

 theta <- matrix(0, nind, nnode)
 root <- matrix(1, nind, nnode)
 x <- raster(theta, pred, fam, root)
 dimnames(x) <- list(NULL, vars)

 data <- as.data.frame(x)
 site <- factor(sample(LETTERS[1:4], nind, replace = TRUE))
 foo <- rnorm(nind)
 data <- data.frame(x, site = site, foo = foo, root = 1)

 redata <- reshape(data, varying = list(vars),
     direction = "long", timevar = "varb", times = as.factor(vars),
     v.names = "resp")

 out <- aster(resp ~ foo + site, pred, fam, varb, id, root, data = redata)
 sout1 <- summary(out, show.graph = TRUE)

 out <- aster(resp ~ foo + site + varb, pred, fam, varb, id, root,
     data = redata)
 sout2 <- summary(out)

 out0 <- aster(resp ~ foo + site + varb, pred, fam, varb, id, root,
     origin = rep(0, nind * nnode), data = redata)
 sout0 <- summary(out0)

 foo <- new.env(parent = emptyenv())
 bar <- suppressWarnings(try(load("formula.rda", foo), silent = TRUE))
 if (inherits(bar, "try-error")) {
     save(sout0, sout1, sout2, file = "formula.rda")
 } else {
     print(all.equal(sout0, foo$sout0))
     print(all.equal(sout1, foo$sout1))
     print(all.equal(sout2, foo$sout2))
 }

 ncoef <- length(out$coefficients)
 foo <- as.numeric(out0$origin) +
     matrix(out0$modmat, ncol = ncoef) %*% out0$coefficients
 bar <- as.numeric(out$origin) +
     matrix(out$modmat, ncol = ncoef) %*% out$coefficients
 all.equal(foo, bar)

 all.equal(out$fisher, out0$fisher)
 identical(out$modmat, out0$modmat)

 all.equal(summary(out)$coefficients[ , "Std. Error"],
     summary(out0)$coefficients[ , "Std. Error"])

