library(ragtop)


### Name: spot_to_df_fcn
### Title: Create a discount factor function from a yield curve
### Aliases: spot_to_df_fcn

### ** Examples

disct_fcn = ragtop::spot_to_df_fcn(
  data.frame(time=c(1, 5, 10, 15),
             rate=c(0.01, 0.02, 0.03, 0.05)))
print(disct_fcn(1, 0.5))



