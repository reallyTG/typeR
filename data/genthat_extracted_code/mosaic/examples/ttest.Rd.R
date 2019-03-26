library(mosaic)


### Name: t_test
### Title: Student's t-Test
### Aliases: t_test t.test t_test.formula t_test.default

### ** Examples

  t.test(HELPrct$age)
  # We can now do this with a formula
  t.test(~ age, data = HELPrct)
  # data = can be omitted, but it is better to use it
  t.test(~ age, HELPrct)
  # the original 2-sample formula
  t.test(age ~ sex, data = HELPrct)
  # alternative 2-sample formulas
  t.test(~ age | sex, data = HELPrct)
  t.test(~ age, groups = sex, data = HELPrct)
  # 2-sample t from vectors
  with(HELPrct, t.test(age[sex == "male"], age[sex == "female"]))
  # just the means
  mean(age ~ sex, data = HELPrct)



