context("utils.R")

test_that("find_connection", {
    con <- dbplyr::simulate_mssql()
    src <- dbplyr::src_dbi(con)

    lazy.long <- tbl_lazy(gather(iris, Variable, Value, 1:4), src=src)
    grouped <- group_by(lazy.long, 'Species')

    expect_error(find_connection(lazy.long$ops), 'Could not find base table')
    expect_identical(find_connection(lazy.long), con)
    expect_identical(find_connection(grouped), con)
    
    tab <- make_tbl(c("test", "lazy"), src = src)
    base <- op_base( tab, vars=tbl_vars(iris), 'test') 
    op.group <- op_single("group_by", x=tab, dots=quos(Species))
    
    expect_identical(find_connection(base), con)
    expect_identical(find_connection(op.group), con)
})
test_that("get_pivot_levels", {
    con <- dbplyr::simulate_mssql()
    src <- dbplyr::src_dbi(con)
    lazy.iris <- tbl_lazy(iris, src=src)
    lazy.long <- tbl_lazy(gather(iris, Variable, Value, 1:4), src=src)


    expect_identical(apply_op(lazy.iris), iris)
    expect_identical( lazy.iris %>% select(Species) %>% distinct() %>% apply_op
                    ,      iris %>% select(Species) %>% distinct()
                    )

    expect_identical( get_pivot_levels(lazy.iris, Species, starts_with('v'))
                    , c(versicolor = 'versicolor', virginica = 'virginica')
                    )
 
    tbl.pivot <- pivot(lazy.iris, Species, mean(Petal.Length, na.rm=TRUE), starts_with('v')) 
    expect_is(tbl.pivot, 'tbl_lazy')
    expect_is(tbl.pivot$ops, 'op_pivot')
    expect_identical(tbl.pivot$ops$dots, quos(starts_with('v')))
    expect_identical( tbl.pivot$ops$args$levels
                    , c(versicolor = 'versicolor', virginica = 'virginica')
                    )
    expect_identical( tbl.pivot$ops$args$key
                    , quo(Species)
                    )
    expect_identical( tbl.pivot$ops$args$value
                    , quo(mean(Petal.Length, na.rm=TRUE))
                    )

})


