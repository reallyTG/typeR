context("curate_deat_animals")


test_that("currate dead danimals works", {

  dt1 <- toy_activity_data()
  dt1[t > days(3), moving := F]
  dt1[t == days(3.5), moving := T]

  dt2 <- curate_dead_animals(dt1)
  dt3 <- curate_dead_animals(dt1,prop_immobile = 0)

  expect_true(abs(max(dt1[,t]) - days(5)) <= 60)
  expect_true(abs(max(dt2[,t]) - days(3)) <= 60)
  expect_true(abs(max(dt3[,t]) - days(3.5)) <= 60)

  dt4 <- dt1[t> days(4.5)]
  dt5 <- dt1[t> days(4.5)]
  dt5[, moving := T]
  dt4 <- curate_dead_animals(dt4)
  expect_equal(nrow(dt4), 0)
  dt5 <- curate_dead_animals(dt5)

  expect_true(abs(diff(range(dt5$t)) - days(.5)) <= 60)

#
#   ggplot(data=dt1[,test:=1],aes(t, as.numeric(moving))) +
#     geom_line(data=dt1[,test:=1]) +
#     geom_line(data=dt2[, test:=2])+
#     geom_line(data=dt3[, test:=3])+
#     geom_line(data=dt4[, test:=4])+
#     geom_line(data=dt5[, test:=5])+
#     facet_grid(test ~ .)+
#     scale_x_time()

})





