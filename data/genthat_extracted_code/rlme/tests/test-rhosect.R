context("Rhosect")

schools = 3
sections = 2
students = 4

n = schools * sections * students

ahat = rnorm(n)

sec = rep(sections, schools)
mat = matrix(students, nrow = schools, ncol = sections)

school.vector = rep(1:schools, each = sections * students)
section.vector = rep(rep(1:sections, each = students), schools)

test_that('rhosect and rhosectC return same values', {
  r1 = rhosect(ahat, school.vector, section.vector)

  r2 = rhosectC(ahat, sec, mat)
  
  expect_equal(r1$rho1, r2$rho1)
  expect_equal(r1$rho2, r2$rho2)
  expect_equal(r1$rho3, r2$rho3)
  expect_equal(r1$rho4, r2$rho4)
})
