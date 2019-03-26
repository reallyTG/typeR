library(grattan)


### Name: model_rent_assistance
### Title: Model Rent Assistance
### Aliases: model_rent_assistance

### ** Examples


library(data.table)
sample <-
  CJ(rent = 1:500,
     n_dependants = 0:3,
     has_partner = 0:1 > 0,
     is_homeowner = 0:1 > 0,
     lives_in_sharehouse = 0:1 > 0)
model_rent_assistance(sample,
                      baseline_fy = "2018-19",
                      .Prop_rent_paid_by_RA = 0.75,
                      Max_rate = 500,
                      Min_rent = 100)



