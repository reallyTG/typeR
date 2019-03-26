library(bitrugs)


### Name: simulate_data_dates
### Title: Nosocomial transmission data simulation with fixed dates.
### Aliases: simulate_data_dates

### ** Examples

    admissions <- sort(sample(1:100,100, replace=TRUE))
    discharge <- admissions + rpois(100,5) + 1
    Tsim <- simulate_data_dates(day_adm=admissions, day_dis=discharge, p=0.1,b=0.01)



