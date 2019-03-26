library(vpc)


### Name: vpc_tte
### Title: VPC function for time-to-event (survival) data
### Aliases: vpc_tte

### ** Examples

## See vpc-docs.ronkeizer.com for more documentation and examples.

## Example for repeated) time-to-event data
## with NONMEM-like data (e.g. simulated using a dense grid)

data(rtte_obs_nm)
data(rtte_sim_nm)

# treat RTTE as TTE, no stratification
vpc_tte(sim = rtte_sim_nm[rtte_sim_nm$sim <= 20,],
       obs = rtte_obs_nm,
       rtte = FALSE,
       sim_cols=list(dv = "dv", idv = "t"), obs_cols=list(idv = "t"))




