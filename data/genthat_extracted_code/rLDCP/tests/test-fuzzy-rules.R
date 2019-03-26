
context("fuzzy rules")

test_that("define operator", {
  op <- list( conjunction = max,  disjunction = min)
    class(op) <- "operator"

  myop <- operator(max,min)

  expect_that (class(myop), equals("operator"))
  expect_that(myop, equals(op))
  expect_that(myop$conjunction, equals(max))
  expect_that(myop$disjunction, equals(min))
  expect_error(operator(4,min))
  expect_error(operator(max,4))

})

test_that("define rule", {
  vrule <- c(0,0,1,0,0, 0,0,1,0,0, 0,0,1,0,0, 0,0,1)
  class(vrule) <- "fuzzy_rule"
  myrule <- fuzzy_rule(0,0,1,0,0, 0,0,1,0,0, 0,0,1,0,0, 0,0,1)
  expect_that (class(myrule), equals("fuzzy_rule"))
  expect_that(myrule, equals(vrule))
  expect_error(rule(0,1,2))
})

test_that("define rules", {

  listrules <- list(fuzzy_rule(0,0,1, 0,0,1, 0,0,1),
                    fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                    fuzzy_rule(0,1,0, 0,1,0, 0,1,0))
  class(listrules) <- "fuzzy_rules"

  myrules <- fuzzy_rules(fuzzy_rule(0,0,1, 0,0,1, 0,0,1),
                         fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                         fuzzy_rule(0,1,0, 0,1,0, 0,1,0))

  expect_that (class(myrules), equals("fuzzy_rules"))
  expect_that(myrules, equals(listrules))

  #the first input is not a rule, it is a vector
  expect_error(fuzzy_rules(c(0,0,1, 0,0,1, 0,0,1),
                           fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                           fuzzy_rule(0,1,0, 0,1,0, 0,1,0)))

  #the lenght of the first rule is 8, the rest is 9
  #All the rule in a rules object must have the same lenght
  expect_error(fuzzy_rules(fuzzy_rule(0,0,1, 0,0,1, 0,0),
                           fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                           fuzzy_rule(0,1,0, 0,1,0, 0,1,0)))
 #Al menos debe recibir una regla como entrada.
  expect_error(rules())
})

test_that("rules inference", {

  wa <-infer_rules(fuzzy_rules(fuzzy_rule(0,0,1, 0,0,1, 0,0,1),
                               fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                               fuzzy_rule(0,1,0, 0,1,0, 0,1,0)),
              operator(min, max),
              list(c(0,0.5,0.5),c(0.5,0.5,0)))


  expect_that (wa, equals(c(0,0.5,0)))

  #receives a list of rules rather than a rules object
  expect_error(infer_rules(list(fuzzy_rule(0,0,1, 0,0,1, 0,0,1),
                                fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                                fuzzy_rule(0,1,0, 0,1,0, 0,1,0)),
                           operator(min, max),
                           list(c(0,0.5,0.5),c(0.5,0.5,0)))
               )
  #receives a list of operators rather than a operator object
  expect_error(infer_rules(fuzzy_rules(fuzzy_rule(0,0,1, 0,0,1, 0,0,1),
                                       fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                                       fuzzy_rule(0,1,0, 0,1,0, 0,1,0)),
                           list(min, max),
                           list(c(0,0.5,0.5),c(0.5,0.5,0)))
  )

  #receives a empty list of inputs
  expect_error(infer_rules(fuzzy_rules(fuzzy_rule(0,0,1, 0,0,1, 0,0,1),
                                 fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                                 fuzzy_rule(0,1,0, 0,1,0, 0,1,0)),
                           operator(min, max),
                           list())
  )
  #The length of the input is greater than the length of the rules
  expect_error(infer_rules(fuzzy_rules(fuzzy_rule(0,0,1, 0,0,1, 0,0,1),
                                       fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                                       fuzzy_rule(0,1,0, 0,1,0, 0,1,0)),
                           operator(min, max),
                           list(c(0,0.5,0.5),c(0.5,0.5,0),c(0,0.5,0.5)))
  )
})
