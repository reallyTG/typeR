library(CorporaCoCo)
library(data.table)
library(unittest, quietly=TRUE)

test_for_error <- function(code, expected_regexp = '.+') {
    tryCatch({
            code
            return("No error returned")
        }, error = function(e) {
            if(grepl(expected_regexp, e$message)) return(TRUE)
            return(c(e$message, "Expected error did not match - ", expected_regexp))
        }
    )
}


# -----
# tests
# -----

ok_group("main", {
    A <- surface(
        x = c(
            rep(c("a", "man", NA), 100),
            rep(c("a", "plan", NA), 100),
            rep(c("a", "cat", NA), 100),
            rep(c("a", "badger", NA), 50),
            rep(c("a", "snake", NA), 100),
            rep(c("the", "man", NA), 100),
            rep(c("the", "plan", NA), 100),
            rep(c("another", "man", NA), 100),
            rep(c("another", "plan", NA), 100)
        ),
        span = '1R'
    )
    B <- surface(
        x = c(
            rep(c("a", "man", NA), 60),
            rep(c("a", "plan", NA), 100),
            rep(c("a", "cat", NA), 50),
            rep(c("a", "badger", NA), 100),
            rep(c("a", "mushroom", NA), 100),
            rep(c("a", "canal", NA), 40),
            rep(c("the", "man", NA), 60),
            rep(c("the", "plan", NA), 100),
            rep(c("the", "canal", NA), 40),
            rep(c("another", "man", NA), 60),
            rep(c("another", "plan", NA), 100),
            rep(c("another", "canal", NA), 40)
        ),
        span = '1R'
    )
    nodes <- c("a", "the")

    rv <- coco(A, B, nodes = nodes, fdr = 1.0)

    ok( is(rv, 'coco'), "is class 'coco'")
    ok( is(rv, 'data.table'), "is class 'data.table'")
    ok( is(rv, 'data.frame'), "is class 'data.frame'")

    ok( all.equal(sort(nodes), sort(unique(rv$x))), "expected nodes in results")
    ok( all(rv$y %in% c('man', 'plan', 'canal', 'cat', 'badger', 'mushroom', 'snake')), "all collocates of nodes from both corpora in results")

    ok( all.equal(rv[x=='a' & y=='cat', effect_size], -rv[x=='a' & y=='badger', effect_size]), "effect_size is symetric") 
    ok( rv[x=='a' & y=='cat', effect_size] < 0 &&
        rv[x=='a' & y=='cat', CI_upper] < 0
    , "effect_size, CI_upper when co-occurrence ratio is greater in corpus A") 
    ok( rv[x=='a' & y=='badger', effect_size] > 0 &&
        rv[x=='a' & y=='badger', CI_lower] > 0
    , "effect_size, CI_lower when co-occurrence ratio is greater in corpus B") 
    ok(
        rv[x=='a' & y=='snake', effect_size] < 0 && is.infinite(rv[x=='a' & y=='snake', effect_size]) &&
        rv[x=='a' & y=='snake', CI_lower] < 0 && is.infinite(rv[x=='a' & y=='snake', CI_lower]) &&
        rv[x=='a' & y=='snake', CI_upper] < 0 && is.finite(rv[x=='a' & y=='snake', CI_upper])
    , "effect_size, CI_upper, CI_lower if collocate is only in corpus A")
    ok(
        rv[x=='a' & y=='canal', effect_size] > 0 && is.infinite(rv[x=='a' & y=='canal', effect_size]) &&
        rv[x=='a' & y=='canal', CI_lower] > 0 && is.finite(rv[x=='a' & y=='canal', CI_lower]) &&
        rv[x=='a' & y=='canal', CI_upper] > 0 && is.infinite(rv[x=='a' & y=='canal', CI_upper])
    , "effect_size, CI_upper, CI_lower if collocate is only in corpus B")

    rv_2 <- rv[x == "a"]
    rv_3 <- coco(A, B, nodes = "a", fdr = 1.0)
    attr(rv_2, 'coco_metadata') <- NULL
    attr(rv_3, 'coco_metadata') <- NULL
    ok(identical(rv_2, rv_3), "single node (as a string)")

    rv <- coco(A, B, nodes = nodes)
    ok( all(identical(c("a", "a", "a", "a", "a", "a", "the", "the"), sort(rv$x)), identical(c("badger", "canal", "canal", "cat", "man", "man", "mushroom", "snake"), sort(rv$y))), "correct set of significant results")

    ok( identical(attr(rv, 'coco_metadata')$nodes, nodes), "object metadata nodes look good")

    # collocates filter
    rv_f <- coco(A, B, nodes = nodes, collocates = c("badger", "man"))
    ok( identical(rv_f[, -"p_adjusted"], rv[y %in% c("badger", "man"), -"p_adjusted"]), "collocates filter - vector - rows")
    ok( ! isTRUE(all.equal(rv_f$p_adjusted, rv[y %in% c("badger", "man")]$p_adjusted)), "collocates filter - vector - p_adjusted values")

    rv_f <- coco(A, B, nodes = nodes, collocates = "cat")
    ok( identical(rv_f[, -"p_adjusted"], rv[y == "cat", -"p_adjusted"]), "collocates filter - string - rows")
    ok( isTRUE(all.equal(rv_f$p_value, rv_f$p_adjusted)), "collocates filter - string - p_adjusted values")
})


ok_group("bad arguments", {
    A <- surface(
        x = c(
            rep(c("a", "man", NA), 100),
            rep(c("a", "plan", NA), 100),
            rep(c("the", "man", NA), 100),
            rep(c("the", "plan", NA), 100),
            rep(c("another", "man", NA), 100),
            rep(c("another", "plan", NA), 100)
        ),
        span = '1R'
    )
    B <- surface(
        x = c(
            rep(c("a", "man", NA), 60),
            rep(c("a", "plan", NA), 100),
            rep(c("a", "canal", NA), 40),
            rep(c("the", "man", NA), 60),
            rep(c("the", "plan", NA), 100),
            rep(c("the", "canal", NA), 40),
            rep(c("another", "man", NA), 60),
            rep(c("another", "plan", NA), 100),
            rep(c("another", "canal", NA), 40)
        ),
        span = '1R'
    )
    nodes <- c("a", "the")


    ok(test_for_error(coco(, B, nodes)), "A not given")
    ok(test_for_error(coco(B = B, nodes = nodes)), "A not given (named)")
    ok(test_for_error(coco(A, ,nodes)), "B not given")
    ok(test_for_error(coco(A = A, nodes = nodes)), "B not given (named)")
    ok(test_for_error(coco(A, B)), "nodes not given")
    ok(test_for_error(coco(A = A, B = B)), "nodes not given (named)")

    A_bad <- A
    A_bad$x <- as.factor(A_bad$x)
    B_bad <- B
    B_bad$H <- as.factor(B_bad$H)

    ok(test_for_error(coco(A = "foo", B = B, nodes = nodes), "'A'"), "bad A - not a data.frame")
    ok(test_for_error(coco(A = A_bad, B = B, nodes = nodes), "'A'"), "bad A - bad column")
    ok(test_for_error(coco(A = A, B = as.matrix(B), nodes = nodes), "'B'"), "bad B - not a data.frame")
    ok(test_for_error(coco(A = A, B = B_bad, nodes = nodes), "'B'"), "bad B - bad column")
    ok(test_for_error(coco(A = A, B = B, nodes = 1:3), "'nodes'"), "bad nodes - not char")
    ok(test_for_error(coco(A = A, B = B, nodes = nodes, fdr = 0.0), "'fdr'"), "bad fdr - zero")
    ok(test_for_error(coco(A = A, B = B, nodes = nodes, fdr = -0.4), "'fdr'"), "bad fdr - negative")
    ok(test_for_error(coco(A = A, B = B, nodes = nodes, fdr = 100), "'fdr'"), "bad fdr - greater than one")
    ok(test_for_error(coco(A = A, B = B, nodes = nodes, fdr = "100"), "'fdr'"), "bad fdr - char")
    ok(test_for_error(coco(A = A, B = B, nodes = nodes, fdr = c(0.05, 0.10)), "'fdr'"), "bad fdr - length 2 numeric vector")
})





