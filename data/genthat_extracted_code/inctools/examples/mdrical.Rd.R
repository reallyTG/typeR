library(inctools)


### Name: mdrical
### Title: Estimate Mean Duration of Recent Infection (MDRI)
### Aliases: mdrical

### ** Examples

mdrical(data=excalibdata,
        subid_var = "SubjectID",
        time_var = "DaysSinceEDDI",
        recency_cutoff_time = 730.5,
        inclusion_time_threshold = 800,
        functional_forms = c("cloglog_linear"),
        recency_rule = "binary_data",
        recency_vars = "Recent",
        n_bootstraps = 10,
        alpha = 0.05,
        plot = TRUE)



