library(nomisr)


### Name: nomis_get_data
### Title: Retrieve Nomis datasets
### Aliases: nomis_get_data

### ** Examples

## No test: 

# Return data on Jobseekers Allowance for each country in the UK
jobseekers_country <- nomis_get_data(id = "NM_1_1", time = "latest",
                                     geography = "TYPE499",
                                     measures = c(20100, 20201), sex = 5)

tibble::glimpse(jobseekers_country)

# Return data on Jobseekers Allowance for Wigan
jobseekers_wigan <- nomis_get_data(id = "NM_1_1", time = "latest",
                                   geography = "1879048226",
                                   measures = c(20100, 20201), sex = "5")

tibble::glimpse(jobseekers_wigan)

# annual population survey - regional - employment by occupation
emp_by_occupation <- nomis_get_data(id = "NM_168_1", time = "latest",
                                    geography = "2013265925", sex = "0",
                                    select = c("geography_code",
                                    "C_OCCPUK11H_0_NAME", "obs_vAlUE"))

tibble::glimpse(emp_by_occupation)

# Deaths in 2016 and 2015 by three specified causes, 
# identified with nomis_get_metadata()
death <- nomis_get_data("NM_161_1", date = c("2016","2015"),
                        geography = "TYPE480",
                        cause_of_death = c(10300, 102088, 270))

tibble::glimpse(death)

# All causes of death in London in 2016
london_death <- nomis_get_data("NM_161_1", date = c("2016"),
                               geography = "2013265927", sex = 1, age = 0)

tibble::glimpse(london_death)
## End(No test)
## Not run: 
##D  # Results in an error because `measure` is mistaken for `measures`
##D  mort_data1 <- nomis_get_data(id = "NM_161_1", date = "2016",
##D    geography = "TYPE464", sex = 0, cause_of_death = "10381",
##D    age = 0, measure = 6)
##D 
##D  # Does not error because `measures` is specified
##D  mort_data2 <- nomis_get_data(id = "NM_161_1", date = "2016",
##D    geography = "TYPE464", sex = 0, measures = NULL,
##D    cause_of_death = "10381", age = 0, measure = 6)
## End(Not run)



