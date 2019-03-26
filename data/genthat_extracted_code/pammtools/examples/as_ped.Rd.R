library(pammtools)


### Name: as_ped
### Title: Transform data to Piece-wise Exponential Data (PED)
### Aliases: as_ped as_ped.data.frame as_ped.nested_fdf as_ped.list is.ped

### ** Examples

tumor[1:3, ]
tumor[1:3, ] %>% as_ped(Surv(days, status)~ age + sex, cut = c(0, 500, 1000))
tumor[1:3, ] %>% as_ped(Surv(days, status)~ age + sex)



