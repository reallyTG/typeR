context("tidyr.R")

test_that("spread.tbl_lazy", {
    con <- dbplyr::simulate_mssql()
    src <- dbplyr::src_dbi(con)
    lazy.long <- tbl_lazy(gather(iris, Variable, Value, 1:4), src=src)

    wide <- spread(lazy.long, Species, mean(Value))
    expect_is(wide, 'tbl_lazy')
    expect_is(wide$ops, 'op_pivot') 
    expect_equal(wide$ops$dots, quos(tidyselect::everything()))
    expect_equal( wide$ops$args$levels
                , rlang::set_names(c('setosa', 'versicolor', 'virginica'))
                )
    expect_equal( wide$ops$args$key, quo(Species))
    expect_equal( wide$ops$args$value, quo(mean(Value)))
    
    wide2 <- apply_op(wide)
    expected <- iris %>% 
        group_by(Species) %>% summarise_all(mean) %>% 
        gather(Variable, Value, -Species) %>%
        spread(Species, Value)
    
    expect_equal(wide2, expected)
})
test_that("gather.tbl_lazy", {

})
