test_that("Template", {

  expectEqual <- function(a, b) testthat::expect_equal(a, b)

##############################################################################

  t1 <- tmpl( ~ {
    return(2 * {{ a }})
  })

  expectEqual(
    tmplAsFun(
      t1,
      a ~ x * 2
    )(x = 1),
    4
  )

  testthat::expect_error(
    tmplAsFun(t1), "'a' not found"
  )

  sqlTemplate <- tmpl(
    ~ {{ collapse(ids) }}
  )

  collapse <- function(x) paste(x, collapse = ", ")

  expectEqual(
    as.character(
      tmpl(
        sqlTemplate,
        ids = 1:2
      )),
    "1, 2"
  )

  t2 <- function(x) {
    return(2 * {{ a }})
  }

  expectEqual(
    tmpl(t2, a ~ x * 2)(2),
    8
  )


##############################################################################

  t3 <- tmpl(
    "{{ (function() {1})() }}
     {{ '\"HuHu\"' }}"
  )

  t3Eval <- tmpl(
    "1
     \"HuHu\""
  )

  expectEqual(
    unclass(tmpl(t3, b ~ forceEval)),
    unclass(t3Eval)
  )

##############################################################################

  t4 <- tmpl(
    "{{ a }}"
  )

  expectEqual(
    tmplAsFun(
      t4,
      a ~ 2
    )(),
    2
  )

  expectEqual(
    tmplAsFun(
      t4,
      a ~ x * 2
    )(x = 2),
    4
  )

  expectEqual(
    tmplAsFun(
      t4,
      a ~ a
    )(a = 1),
    1
  )

##############################################################################

  t5 <- tmpl( ~ {
    2
  })

  t6 <- tmpl( ~ {
    y <- 1
    y
  })

  expectEqual(tmplEval(t5), 2)
  expectEqual(tmplEval(t6), 1)
  expectEqual(exists("y"), FALSE)

################################################################################

  expectEqual(
    local({
      dep <- function() 1
      tmplEval(tmpl("{{ dep() }}"), a ~ trigger)
    }),
    1
  )

################################################################################

  expectEqual(
    tmplEval(tmpl("{{ a }} + {{ b }}", list(a = 1), b ~ 2)),
    3
  )

################################################################################

  expectEqual(
    as.character(tmpl("hi {{ null }}", null = NULL)),
    "hi "
  )

  expectEqual(
    as.character(tmpl("{{ first }} {{ second }}", first = 1, second = NULL)),
    "1 "
  )

  expectEqual(
    as.character(tmpl("{{ first }} {{ second }}", first = NULL, second = 1)),
    " 1"
  )

################################################################################

  expectEqual(
    # from #2
    as.character(templates::tmpl(
      "{{ paste(arg1, collapse = '') }}{{a}}{{b}}",
      arg1 = letters[1:2],
      arg2 = list(a = "a", b = "b")
    )),
    "abab"
  )

################################################################################

  expectEqual(
    # from #3
    as.character(tmpl("\\section{{{ sectionName }}}", sectionName = "foo")),
    "\\section{foo}"
  )

  expectEqual(
    # implication from #3
    as.character(tmpl(tmpl("{{{{ a }}}}", a = "b"), b = "c")),
    "c"
  )

})
