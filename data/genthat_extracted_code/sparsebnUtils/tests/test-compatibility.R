context("compatibility")

sbf.empty <- generate_empty_sparsebnFit()
sbp.empty <- generate_empty_sparsebnPath()
sbp <- generate_fixed_sparsebnPath()
sbf <- generate_fixed_sparsebnFit()

### Special test case: Last node is isolated (this breaks the network package constructor)
edgeL <- edgeList(list(2, integer(0), integer(0)))
sbf.isolated.last <- generate_fixed_sparsebnFit(edgeL)
sbp.isolated.last <- generate_fixed_sparsebnPath(sbf.isolated.last)

test_that("Coercion works on empty graphs", {
    ### sparsebnFit
    if(requireNamespace("graph", quietly = TRUE)){
        expect_equivalent(sbf.empty, to_edgeList(to_graphNEL(sbf.empty)))
    }

    if(requireNamespace("igraph", quietly = TRUE)){
        expect_equivalent(sbf.empty, to_edgeList(to_igraph(sbf.empty)))
    }

    if(requireNamespace("network", quietly = TRUE)){
        expect_equivalent(sbf.empty, to_edgeList(to_network(sbf.empty)))
    }

    if(requireNamespace("bnlearn", quietly = TRUE)){
        expect_equivalent(sbf.empty, to_edgeList(to_bn(sbf.empty)))
    }

    ### sparsebnPath
    if(requireNamespace("graph", quietly = TRUE)){
        expect_equivalent(sbp.empty, to_edgeList(to_graphNEL(sbp.empty)))
    }

    if(requireNamespace("igraph", quietly = TRUE)){
        expect_equivalent(sbp.empty, to_edgeList(to_igraph(sbp.empty)))
    }

    if(requireNamespace("network", quietly = TRUE)){
        expect_equivalent(sbp.empty, to_edgeList(to_network(sbp.empty)))
    }

    if(requireNamespace("bnlearn", quietly = TRUE)){
        expect_equivalent(sbp.empty, to_edgeList(to_bn(sbp.empty)))
    }
})

test_that("Coercion to graphNEL works", {
    ### All of these tests require the graph pkg
    if(requireNamespace("graph", quietly = TRUE)){
        ### Check that output is a valid graphNEL object
        expect_is(to_graphNEL(sbf)$edges, "graphNEL")
        expect_true(check_list_class(lapply(to_graphNEL(sbp), function(x) x$edges), "graphNEL"))

        ### Check that nothing changes
        expect_equivalent(sbf, to_edgeList(to_graphNEL(sbf)))
        expect_equivalent(sbp, to_edgeList(to_graphNEL(sbp)))

        ### Check that nothing changes
        expect_equivalent(sbf.isolated.last, to_edgeList(to_graphNEL(sbf.isolated.last)))
        expect_equivalent(sbp.isolated.last, to_edgeList(to_graphNEL(sbp.isolated.last)))
    }
})

test_that("Coercion to igraph works", {
    ### All of these tests require the igraph pkg
    if(requireNamespace("igraph", quietly = TRUE)){
        ### Check that output is a valid igraph object
        expect_is(to_igraph(sbf)$edges, "igraph")
        expect_true(check_list_class(lapply(to_igraph(sbp), function(x) x$edges), "igraph"))

        ### Check that nothing changes
        expect_equivalent(sbf, to_edgeList(to_igraph(sbf)))
        expect_equivalent(sbp, to_edgeList(to_igraph(sbp)))

        ### Check that nothing changes
        expect_equivalent(sbf.isolated.last, to_edgeList(to_igraph(sbf.isolated.last)))
        expect_equivalent(sbp.isolated.last, to_edgeList(to_igraph(sbp.isolated.last)))
    }
})

test_that("Coercion to network works", {
    ### All of these tests require the network pkg
    if(requireNamespace("network", quietly = TRUE)){
        ### Check that output is a valid network object
        expect_is(to_network(sbf)$edges, "network")
        expect_true(check_list_class(lapply(to_network(sbp), function(x) x$edges), "network"))

        ### Check that nothing changes
        expect_equivalent(sbf, to_edgeList(to_network(sbf)))
        expect_equivalent(sbp, to_edgeList(to_network(sbp)))

        ### Check that nothing changes
        expect_equivalent(sbf.isolated.last, to_edgeList(to_network(sbf.isolated.last)))
        expect_equivalent(sbp.isolated.last, to_edgeList(to_network(sbp.isolated.last)))
    }
})

test_that("Coercion to bn works", {
    ### All of these tests require the bnlearn pkg
    if(requireNamespace("bnlearn", quietly = TRUE)){
        ### Check that output is a valid network object
        expect_is(to_bn(sbf)$edges, "bn")
        expect_true(check_list_class(lapply(to_bn(sbp), function(x) x$edges), "bn"))

        ### Check that nothing changes
        expect_equivalent(sbf, to_edgeList(to_bn(sbf)))
        expect_equivalent(sbp, to_edgeList(to_bn(sbp)))

        ### Check that nothing changes
        expect_equivalent(sbf.isolated.last, to_edgeList(to_bn(sbf.isolated.last)))
        expect_equivalent(sbp.isolated.last, to_edgeList(to_bn(sbp.isolated.last)))
    }
})

test_that("Iterative coercing works", {
    ### Check for all 4 suggested pkgs
    pkg_check <- requireNamespace("graph", quietly = TRUE) &
                 requireNamespace("igraph", quietly = TRUE) &
                 requireNamespace("network", quietly = TRUE) &
                 requireNamespace("bnlearn", quietly = TRUE)

    if(pkg_check){
        ### Empty graphs: sparsebnFit
        expect_equivalent(sbf.empty, to_edgeList(to_graphNEL(to_network(to_igraph(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_graphNEL(to_igraph(to_network(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_graphNEL(to_bn(to_network(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_graphNEL(to_network(to_bn(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_graphNEL(to_bn(to_igraph(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_graphNEL(to_igraph(to_bn(sbf.empty)))))

        expect_equivalent(sbf.empty, to_edgeList(to_igraph(to_network(to_graphNEL(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_igraph(to_graphNEL(to_network(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_igraph(to_bn(to_network(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_igraph(to_network(to_bn(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_igraph(to_bn(to_graphNEL(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_igraph(to_graphNEL(to_bn(sbf.empty)))))

        expect_equivalent(sbf.empty, to_edgeList(to_network(to_igraph(to_graphNEL(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_network(to_graphNEL(to_igraph(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_network(to_bn(to_igraph(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_network(to_igraph(to_bn(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_network(to_bn(to_graphNEL(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_network(to_graphNEL(to_bn(sbf.empty)))))

        expect_equivalent(sbf.empty, to_edgeList(to_bn(to_igraph(to_graphNEL(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_bn(to_graphNEL(to_igraph(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_bn(to_network(to_igraph(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_bn(to_igraph(to_network(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_bn(to_network(to_graphNEL(sbf.empty)))))
        expect_equivalent(sbf.empty, to_edgeList(to_bn(to_graphNEL(to_network(sbf.empty)))))

        ### Non-empty graphs: sparsebnFit
        expect_equivalent(sbf, to_edgeList(to_graphNEL(to_network(to_igraph(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_graphNEL(to_igraph(to_network(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_graphNEL(to_bn(to_network(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_graphNEL(to_network(to_bn(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_graphNEL(to_bn(to_igraph(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_graphNEL(to_igraph(to_bn(sbf)))))

        expect_equivalent(sbf, to_edgeList(to_igraph(to_network(to_graphNEL(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_igraph(to_graphNEL(to_network(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_igraph(to_bn(to_network(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_igraph(to_network(to_bn(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_igraph(to_bn(to_graphNEL(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_igraph(to_graphNEL(to_bn(sbf)))))

        expect_equivalent(sbf, to_edgeList(to_network(to_igraph(to_graphNEL(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_network(to_graphNEL(to_igraph(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_network(to_bn(to_igraph(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_network(to_igraph(to_bn(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_network(to_bn(to_graphNEL(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_network(to_graphNEL(to_bn(sbf)))))

        expect_equivalent(sbf, to_edgeList(to_bn(to_igraph(to_graphNEL(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_bn(to_graphNEL(to_igraph(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_bn(to_network(to_igraph(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_bn(to_igraph(to_network(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_bn(to_network(to_graphNEL(sbf)))))
        expect_equivalent(sbf, to_edgeList(to_bn(to_graphNEL(to_network(sbf)))))

        ### Non-empty graphs: sparsebnPath
        expect_equivalent(sbp, to_edgeList(to_graphNEL(to_network(to_igraph(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_graphNEL(to_igraph(to_network(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_graphNEL(to_bn(to_network(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_graphNEL(to_network(to_bn(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_graphNEL(to_bn(to_igraph(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_graphNEL(to_igraph(to_bn(sbp)))))

        expect_equivalent(sbp, to_edgeList(to_igraph(to_network(to_graphNEL(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_igraph(to_graphNEL(to_network(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_igraph(to_bn(to_network(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_igraph(to_network(to_bn(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_igraph(to_bn(to_graphNEL(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_igraph(to_graphNEL(to_bn(sbp)))))

        expect_equivalent(sbp, to_edgeList(to_network(to_igraph(to_graphNEL(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_network(to_graphNEL(to_igraph(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_network(to_bn(to_igraph(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_network(to_igraph(to_bn(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_network(to_bn(to_graphNEL(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_network(to_graphNEL(to_bn(sbp)))))

        expect_equivalent(sbp, to_edgeList(to_bn(to_igraph(to_graphNEL(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_bn(to_graphNEL(to_igraph(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_bn(to_network(to_igraph(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_bn(to_igraph(to_network(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_bn(to_network(to_graphNEL(sbp)))))
        expect_equivalent(sbp, to_edgeList(to_bn(to_graphNEL(to_network(sbp)))))
    }
})
