library(broom)


### Name: tidy.survexp
### Title: Tidy a(n) survexp object
### Aliases: tidy.survexp sexpfit_tidiers survexp_tidiers

### ** Examples


library(survival)
sexpfit <- survexp(
  futime ~ 1,
  rmap = list(
    sex = "male",
    year = accept.dt,
    age = (accept.dt - birth.dt)
  ),
  method = 'conditional',
  data = jasa
)

tidy(sexpfit)
glance(sexpfit)




