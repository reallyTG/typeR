library(fabricatr)


### Name: fabricate
### Title: Fabricate data
### Aliases: fabricate add_level modify_level nest_level

### ** Examples



# Draw a single-level dataset with a covariate
building_df <- fabricate(
  N = 100,
  height_ft = runif(N, 300, 800)
)
head(building_df)

# Start with existing data instead
building_modified <- fabricate(
  data = building_df,
  rent = rnorm(N, mean = height_ft * 100, sd = height_ft * 30)
)

# Draw a two-level hierarchical dataset
# containing cities within regions
multi_level_df <- fabricate(
 regions = add_level(N = 5),
 cities = add_level(N = 2, pollution = rnorm(N, mean = 5)))
head(multi_level_df)

# Start with existing data and add a nested level:
company_df <- fabricate(
 data = building_df,
 company_id = add_level(N=10, is_headquarters = sample(c(0, 1), N, replace=TRUE))
)

# Start with existing data and add variables to hierarchical data
# at levels which are already present in the existing data.
# Note: do not provide N when adding variables to an existing level
fabricate(
  data = multi_level_df,
  regions = modify_level(watershed = sample(c(0, 1), N, replace = TRUE)),
  cities = modify_level(runoff = rnorm(N))
)

# fabricatr can add variables that are higher-level summaries of lower-level
# variables via a split-modify-combine logic and the \code{by} argument

multi_level_df <-
 fabricate(
   regions = add_level(N = 5, elevation = rnorm(N)),
   cities = add_level(N = 2, pollution = rnorm(N, mean = 5)),
   cities = modify_level(by = "regions", regional_pollution = mean(pollution))
 )

# fabricatr can also make panel or cross-classified data. For more
# information about syntax for this functionality please read our vignette
# or check documentation for \code{link_levels}:
cross_classified <- fabricate(
  primary_schools = add_level(N = 50, ps_quality = runif(N, 0, 10)),
  secondary_schools = add_level(N = 100, ss_quality = runif(N, 0, 10), nest=FALSE),
  students = link_levels(N = 2000,
                          by=join(ps_quality, ss_quality, rho = 0.5),
                          student_quality = ps_quality + 3*ss_quality + rnorm(N)))



