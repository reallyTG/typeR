library(CorporaCoCo)
library(data.table)
library(unittest, quietly=TRUE)

ok_group("main", {
    a = c(
        rep(c("a", "man", NA), 100),
        rep(c("a", "plan", NA), 100),
        rep(c("the", "man", NA), 100),
        rep(c("the", "plan", NA), 100),
        rep(c("another", "man", NA), 100),
        rep(c("another", "plan", NA), 100)
    )
    b = c(
        rep(c("a", "man", NA), 60),
        rep(c("a", "plan", NA), 100),
        rep(c("a", "canal", NA), 40),
        rep(c("the", "man", NA), 60),
        rep(c("the", "plan", NA), 100),
        rep(c("the", "canal", NA), 40),
        rep(c("another", "man", NA), 60),
        rep(c("another", "plan", NA), 100),
        rep(c("another", "canal", NA), 40)
    )
    nodes <- c("a", "the")

    rv_1 <- coco(
        surface(a, span = '1R'),
        surface(b, span = '1R'),
        nodes = nodes, fdr = 0.01
    )
    rv_2 <- surface_coco(a, b, span = '1R', nodes = nodes, fdr = 0.01)
    ok( identical(rv_1, rv_2), "surface_coco")

    rv_3 <- coco(
        surface(a, span = '1R', collocates = "man"),
        surface(b, span = '1R', collocates = "man"),
        nodes = nodes, fdr = 0.01, collocates = "man"
    )
    rv_4 <- surface_coco(a, b, span = '1R', nodes = nodes, fdr = 0.01, collocates = "man")
    ok( identical(rv_3, rv_4), "surface_coco with collocates filter")
})


