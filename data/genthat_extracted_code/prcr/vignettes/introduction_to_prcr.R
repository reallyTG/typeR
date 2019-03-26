## ------------------------------------------------------------------------
library(prcr)

df <- mtcars

two_profile_solution <- create_profiles(df, 
                                        disp, hp, wt,
                                        n_profiles = 2, 
                                        to_scale = T)

summary(two_profile_solution)

print(two_profile_solution)

plot(two_profile_solution)

## ------------------------------------------------------------------------
two_profile_solution$.data
two_profile_solution$r_squared
two_profile_solution$clustered_raw_data
two_profile_solution$clustered_processed_data

## ---- message = F--------------------------------------------------------
r_squared_output <- plot_r_squared(df, 
                                   disp, hp, wt,
                                   to_scale = T,
                                   r_squared_table = TRUE,
                                   lower_bound = 2, upper_bound = 4)
r_squared_output

## ---- message = F--------------------------------------------------------
cross_validation_output <- cross_validate(df,
                                          disp, hp, wt,
                                          to_scale = TRUE,
                                          n_profiles = 2,
                                          distance_metric = "squared_euclidean",
                                          linkage = "complete", 
                                          k = 30)
cross_validation_output

