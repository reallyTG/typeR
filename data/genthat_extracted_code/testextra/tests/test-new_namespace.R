#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `new_namespace.R`')
#line 48 "R/new_namespace.R"
test_that('new_namespace_env', {#@testing
    ns <- new_namespace_env("test namespace")
    expect_true(isNamespace(ns))
    expect_false(isNamespaceLoaded("test namespace"))
})
#line 68 "R/new_namespace.R"
test_that('new_pkg_environment', {#@testing
    ns <- new_pkg_environment()
    expect_true(isNamespace(ns))
    expect_equal(getPackageName(ns), "test package environment")
    expect_equal(environmentName(ns), "test package environment")
    expect_false(is_namespace_registered(ns))

    if (is_namespace_registered("pkg2"))
        unregister_namespace(asNamespace("pkg2"))

    ns2 <- new_pkg_environment("pkg2", register=TRUE)
    expect_true(isNamespace(ns2))
    expect_equal(getPackageName(ns2), "pkg2")
    expect_equal(environmentName(ns2), "pkg2")
    expect_true(is_namespace_registered('pkg2'))
})
#line 84 "R/new_namespace.R"
test_that('Can define classes, generics and methods.', {#@testing Can define classes, generics and methods.
    ns <- new_pkg_environment("class-test", register=TRUE)
    expect_true(isNamespace(ns))
    expect_equal(getPackageName(ns), "class-test")
    expect_equal(environmentName(ns), "class-test")
    expect_true(is_namespace_registered(ns))

    cls <- setClass("my-test-class", contains='list', where=ns)
    expect_is(cls, 'classGeneratorFunction')
    expect_true(exists(classMetaName(cls@className), ns))

    val <- setGeneric( "my_generic", function(object)stop('not implimented')
                     , where = ns )
    expect_identical(val, "my_generic")
    expect_true(exists('my_generic', ns))

    val <- setMethod('my_generic', 'my-test-class', function(object){
        "horray it works"
    }, where=ns)
    expect_identical(val, "my_generic")
    expect_true(exists(methodsPackageMetaName('T', "my_generic", getPackageName(ns)), ns))
    expect_true(exists('my-test-class'
                      , get( methodsPackageMetaName('T', "my_generic", getPackageName(ns))
                           , ns)))

    unregister_namespace(ns)
    expect_false(is_namespace_registered(ns))
    expect_false(unregister_namespace(ns))
})
#line 113 "R/new_namespace.R"
test_that('can specify imports', {#@testing can specify imports
    pkg <- new_pkg_environment('test-import', import=c('methods', 'testextra'))
    expect_true(isNamespace(pkg))
    expect_true("testextra" %in% names(pkg$.__NAMESPACE__.$imports))
    expect_true(exists("new_pkg_environment", parent.env(pkg), inherits = TRUE))
})
