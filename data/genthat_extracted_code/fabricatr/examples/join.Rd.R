library(fabricatr)


### Name: join
### Title: Helper function handling specification of which variables to
###   join a cross-classified data on, and what kind of correlation
###   structure needed. Correlation structures can only be provided if the
###   underlying call is a 'link_levels()' call.
### Aliases: join

### ** Examples


panels <- fabricate(
  countries = add_level(N = 150, country_fe = runif(N, 1, 10)),
  years = add_level(N = 25, year_shock = runif(N, 1, 10), nest = FALSE),
  obs = cross_levels(
    by = join(countries, years),
    new_variable = country_fe + year_shock + rnorm(N, 0, 2)
  )
)

schools_data <- fabricate(
  primary_schools = add_level(N = 20, ps_quality = runif(N, 1, 10)),
  secondary_schools = add_level(
    N = 15,
    ss_quality = runif(N, 1, 10),
    nest = FALSE),
  students = link_levels(
    N = 1500,
    by = join(primary_schools, secondary_schools),
    SAT_score = 800 + 13 * ps_quality + 26 * ss_quality + rnorm(N, 0, 50)
  )
)




