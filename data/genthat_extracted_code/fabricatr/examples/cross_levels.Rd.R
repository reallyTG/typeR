library(fabricatr)


### Name: cross_levels
### Title: Creates panel or cross-classified data
### Aliases: cross_levels link_levels

### ** Examples


# Generate full panel data
panel <- fabricate(
 countries = add_level(N = 20, country_shock = runif(N, 1, 10)),
 years = add_level(N = 20, year_shock = runif(N, 1, 10), nest=FALSE),
 obs = cross_levels(by=join(countries, years), GDP_it = country_shock + year_shock)
)

# Include an "N" argument to allow for cross-classified
# data.
students <- fabricate(
 primary_school = add_level(N = 20, ps_quality = runif(N, 1, 10)),
 secondary_school = add_level(N = 15, ss_quality = runif(N, 1, 10), nest=FALSE),
 students = link_levels(N = 500, by = join(primary_school, secondary_school))
)
head(students)

# Induce a correlation structure in cross-classified data by providing
# rho.
students <- fabricate(
 primary_school = add_level(N = 20, ps_quality = runif(N, 1, 10)),
 secondary_school = add_level(N = 15, ss_quality = runif(N, 1, 10), nest=FALSE),
 students = link_levels(N = 500, by = join(ps_quality, ss_quality, rho = 0.5))
)
cor(students$ps_quality, students$ss_quality)




