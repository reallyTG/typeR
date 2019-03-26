library(pammtools)


### Name: make_newdata
### Title: Construct a data frame suitable for prediction
### Aliases: make_newdata make_newdata.default make_newdata.ped
###   make_newdata.fped

### ** Examples

tumor %>% make_newdata()
tumor %>% make_newdata(age=c(50))
tumor %>% make_newdata(days=seq_range(days, 3), age=c(50, 55))
tumor %>% make_newdata(days=seq_range(days, 3), status=unique(status), age=c(50, 55))
# mean/modus values of unspecified variables are calculated over whole data
tumor %>% make_newdata(sex=unique(sex))
tumor %>% group_by(sex) %>% make_newdata()
# You can also pass a part of the data sets as data frame to make_newdata
purrr::cross_df(list(days = c(0, 500, 1000), sex = c("male", "female"))) %>%
  make_newdata(x=tumor)

# Examples for PED data
ped <- tumor %>% slice(1:3) %>% as_ped(Surv(days, status)~., cut = c(0, 500, 1000))
ped %>% make_newdata(age=c(50, 55))
# if time information is specified, other time variables will be specified
# accordingly and offset calculated correctly
ped %>% make_newdata(tend = c(1000), age = c(50, 55))
ped %>% make_newdata(tend = unique(tend))
ped %>% group_by(sex) %>% make_newdata(tend = unique(tend))



