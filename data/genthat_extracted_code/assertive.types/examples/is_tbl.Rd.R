library(assertive.types)


### Name: assert_is_tbl
### Title: Is the input a tbl?
### Aliases: assert_is_tbl assert_is_tbl_cube assert_is_tbl_df
###   assert_is_tbl_dt is_tbl is_tbl_cube is_tbl_df is_tbl_dt

### ** Examples

if(requireNamespace("dplyr"))
{
  assert_is_tbl_df(dplyr::tbl_df(data.frame(x = 1:5)))
  #These examples should fail.
  assertive.base::dont_stop(assert_is_tbl(data.frame(x = 1:5)))
} else
{
  message("This example requires the data.table package to be installed.")
}



