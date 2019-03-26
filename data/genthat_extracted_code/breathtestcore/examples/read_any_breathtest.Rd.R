library(breathtestcore)


### Name: read_any_breathtest
### Title: Read breathtest files of any format
### Aliases: read_any_breathtest

### ** Examples

files = c(
  group_a = btcore_file("IrisCSV.TXT"),
  group_a = btcore_file("350_20043_0_GER.txt"),
  group_b = btcore_file("IrisMulti.TXT"),
  group_b = btcore_file("NewBreathID_01.xml")  
 )
 bt = read_any_breathtest(files)
 str(bt, 1)
 # Passing through cleanup_data gives a data frame/tibble
 bt_df = cleanup_data(bt)
 str(bt_df)
 # If you want data only, use null_fit()
 plot(null_fit(bt_df))
 # Plot population fit with decimated data
 plot(nlme_fit(bt_df))



