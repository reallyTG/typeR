quicr <- function(data, lambda) {
    S    <- cor(data)
    est  <- QUIC::QUIC(S, rho=1, path=lambda, msg=0, tol=1e-2)
    path <-  lapply(seq(length(lambda)), function(i) {
                tmp <- est$X[,,i]; diag(tmp) <- 0
                as(tmp!=0, "lgCMatrix")
    })
    est$path <- path
    est
}


runtests <- function(pfun, pclass, dat, fun, fargs, ...) {
    G <- dat$theta
    test_that("bad crits results in right errors", {
        lams <- getLamPath(.7, .5, 5)
        hargs <- c(fargs, list(lambda=lams))
        expect_error(out <- pfun(dat$data, fun=fun, fargs=hargs, rep.num=2,
           criterion=c("stars", "foo"), ...), "foo")
        expect_error(out <- pfun(dat$data, fun=fun, fargs=hargs, rep.num=2,
                       criterion=c("estrada", "sufficiency"), ...))
    })

    test_that("weird lambda path results in correct error or warning", {
        lams <- seq(.5, .7, length.out=5)
        hargs <- c(fargs, list(lambda=lams))
        expect_warning(out <- pfun(dat$data, fun=fun, fargs=hargs, rep.num=3,
                       ...), "lambda path")
        expect_warning(out <- pfun(dat$data, fun=fun,
              fargs=c(list(lambda=lams[1]), fargs), rep.num=3, ...), "1 value")
        expect_error(out <- pfun(dat$data, fun=fun, fargs=c(list(lams=lams),
                fargs), rep.num=3, ...), "missing")
        expect_warning(out <- pfun(dat$data, fun=fun,
              fargs=c(list(lambda=lams[c(5,4)]), fargs), rep.num=3, ...),
               "supplied values")
    })

    mlam  <- getMaxCov(scale(dat$data))
    lams  <- getLamPath(mlam, 5e-3, 35)
    hargs <- c(fargs, list(lambda=lams))
    out   <- pfun(dat$data, fun=fun, fargs=hargs, criterion="stars", rep.num=12, ...)
    outb  <- update(out, lb.stars=TRUE, ub.stars=TRUE, criterion=c("stars", "gcd"))

    test_that("pulsar w/ lambda path works for fun", {
        ## run pulsar in serial mode
        expect_is(out, pclass)
        expect_equal(out$stars$criterion, "stars.stability")
        # stars summary is monotonic increasing
        expect_equal(out$stars$summary, cummax(out$stars$summary))
        # merge objects dims match original graph, data
        expect_true(all(sapply(out$stars$merge, function(x) all(dim(x) == dim(G)))))
        expect_true(all(sapply(out$stars$merge, function(x) all(dim(x) == ncol(dat$data)))))

    })

    test_that("pulsar bounds are consistent", {
        ## check lengths
##      expect_equal(length(out$gcd$summary), length(out$stars$summary))
        expect_equal(outb$gcd$criterion, "graphlet.stability")
        expect_error(fit <- refit(out, 'stars'), NA)

       # same answer using bounds
        expect_equal(outb$stars$opt.ind, out$stars$opt.ind)

        ## gcd computed between bounds
        expect_equal(length(outb$gcd$summary),
                    outb$stars$lb.index-outb$stars$ub.index+1)
        # same answer using bounds
        expect_equal(opt.index(outb, 'stars'),
                    opt.index(out, 'stars'))
        ## check F1 score is OK
        opt.index(outb, 'gcd') <- get.opt.index(outb, 'gcd')
        pdf(NULL)
        starsF1 <- huge::huge.roc(list(outb$stars$merge[[ opt.index(outb, 'stars') ]] > 0), G, verbose=FALSE)$F1
        gcdF1   <- huge::huge.roc(list(outb$stars$merge[[ opt.index(outb, 'gcd')   ]] > 0), G, verbose=FALSE)$F1
        dev.off()
        expect_gte(gcdF1, starsF1)
    })

    # test_that("calling environments are stored correctly", {
    #   ## test that est parent.frame is current environment
    #   expect_equal(getEnvir(out), parent.frame())
    #   expect_equal(getEnvir(outb), parent.frame())
    # })

    return(list(out=out, outb=outb))
}


runcomptest <- function(msg, out1, out2, ...) {
    test_that(msg, {
      # make sure summary isn't trivally zero
        expect_gt(max(out1$stars$summary), 0)
        expect_gt(max(out2$stars$summary), 0)
        expect_equivalent(out1$stars$summary,   out2$stars$summary)
        expect_equivalent(out1$stars$opt.index, out2$stars$opt.index)
    })
}


testrefit0 <- function(desc, out) {
    test_that(desc, {
        expect_message(fit1 <- refit(out, "stars"), regexp = NA)
        expect_equal(names(fit1$refit), "stars")
        expect_warning(fit3 <- refit(out), regexp = NA)
        expect_gt(sum(fit3$refit$stars), 0)
        expect_warning(fit4 <- refit(out, "foo"), "Unknown criterion")
    })
}

testrefit <- function(desc, outb) {
    test_that(desc, {
        expect_message(fit1 <- refit(outb, "stars"), regexp = NA)
        expect_message(fit2 <- refit(outb, "gcd"), "No optimal index")
        expect_equal(names(fit1$refit), "stars")
        expect_error(opt.index(outb, 'gcd') <- -1, "Index value")
        expect_error(opt.index(outb, 'gcd') <- get.opt.index(outb, 'gcd'), NA)
        expect_equal(opt.index(outb, 'gcd'), outb$gcd$opt.index)
        expect_equal(opt.index(outb, 'gcd'), get.opt.index(outb, 'gcd'))
        expect_warning(fit3 <- refit(outb), regexp = NA)

        expect_gt(sum(fit3$refit$stars), 0)
        expect_gt(sum(fit3$refit$gcd),   0)
        expect_warning(fit4 <- refit(outb, "foo"), "Unknown criterion")
    })
}
