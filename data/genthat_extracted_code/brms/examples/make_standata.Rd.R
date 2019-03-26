library(brms)


### Name: make_standata
### Title: Data for 'brms' Models
### Aliases: make_standata

### ** Examples

data1 <- make_standata(rating ~ treat + period + carry + (1|subject), 
                       data = inhaler, family = "cumulative")
names(data1)

data2 <- make_standata(count ~ log_Age_c + log_Base4_c * Trt_c 
                       + (1|patient) + (1|visit), 
                       data = epilepsy, family = "poisson")
names(data2)
         



