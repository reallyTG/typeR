#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `find_scope.R`')
#line 71 "R/find_scope.R"
test_that('.test_find_scope', {#@testing
    expect_identical( .test_find_scope()
                    , c('pkgcond', '.test_find_scope')
                    )
    expect_identical( .test_find_scope('integer')
                    , c('pkgcond', '.test_find_scope')
                    )
    expect_identical( .test_find_scope('environment')
                    , c('pkgcond', '.test_find_scope')
                    )

    tc <- methods::setRefClass( 'test-class'
                              , fields = list(`find_scope::skipscope`='logical')
                              , methods = list( test_class_scope = function()find_scope()
                                              , initialize = function()`find_scope::skipscope` <<- FALSE
                                              )
                              , where = globalenv())
    obj <- tc()
    expect_identical( obj$test_class_scope()
                    , c('test-class', 'test_class_scope')
                    )

    setGeneric("get_scope", function(object){
        stop('not implimented')
    }, where = globalenv())
    setMethod('get_scope', 'test-class', function(object){
        `find_scope::skipscope` = FALSE
        find_scope()
    }, where = globalenv())
    expect_identical(tail(get_scope(obj), 1), 'get_scope,test-class-method')

    expect_identical(find_scope(1), character(0))
    expect_identical(find_scope(sys.nframe()), character(0))
})
