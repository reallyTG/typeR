library(assertive.types)


### Name: assert_is_data.table
### Title: Is the input a data.table?
### Aliases: assert_is_data.table is_data.table

### ** Examples

if(requireNamespace("data.table"))
{
  assert_is_data.table(data.table::data.table(x = 1:5))
  #These examples should fail.
  assertive.base::dont_stop(assert_is_data.table(list(1,2,3)))
} else
{
  message("This example requires the data.table package to be installed.")
}



