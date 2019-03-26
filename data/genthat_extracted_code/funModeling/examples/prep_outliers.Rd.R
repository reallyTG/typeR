library(funModeling)


### Name: prep_outliers
### Title: Outliers Data Preparation
### Aliases: prep_outliers

### ** Examples

## Not run: 
##D # Creating data frame with outliers
##D set.seed(10)
##D df=data.frame(var1=rchisq(1000,df = 1), var2=rnorm(1000))
##D df=rbind(df, 1135, 2432) # forcing outliers
##D df$id=as.character(seq(1:1002))
##D 
##D # for var1: mean is ~ 4.56, and max 2432
##D summary(df)
##D 
##D ########################################################
##D ### PREPARING OUTLIERS FOR DESCRIPTIVE STATISTICS
##D ########################################################
##D 
##D #### EXAMPLE 1: Removing top 1%% for a single variable
##D # checking the value for the top 1% of highest values (percentile 0.99), which is ~ 7.05
##D quantile(df$var1, 0.99)
##D 
##D # Setting type='set_na' sets NA to the highest value specified by top_percent.
##D # In this case 'data' parameter is single vector, thus it returns a single vector as well.
##D var1_treated=prep_outliers(data = df$var1, type='set_na', top_percent  = 0.01,method = "bottom_top")
##D 
##D # now the mean (~ 1) is more accurate, and note that: 1st, median and 3rd
##D #  quartiles remaining very similar to the original variable.
##D summary(var1_treated)
##D 
##D #### EXAMPLE 2: Removing top and bottom 1% for the specified input variables.
##D vars_to_process=c('var1', 'var2')
##D df_treated3=prep_outliers(data = df, input = vars_to_process, type='set_na',
##D  bottom_percent = 0.01, top_percent  = 0.01, method = "bottom_top")
##D summary(df_treated3)
##D 
##D ########################################################
##D ### PREPARING OUTLIERS FOR PREDICTIVE MODELING
##D ########################################################
##D 
##D data_prep_h=funModeling::prep_outliers(data = heart_disease,
##D input = c('age','resting_blood_pressure'),
##D  method = "hampel",  type='stop')
##D 
##D # Using Hampel method to flag outliers:
##D summary(heart_disease$age);summary(data_prep_h$age)
##D # it changed from 29 to 29.31, and the max remains the same at 77
##D hampel_outlier(heart_disease$age) # checking the thresholds
##D 
##D data_prep_a=funModeling::prep_outliers(data = heart_disease,
##D input = c('age','resting_blood_pressure'),
##D  method = "tukey",  type='stop')
##D 
##D max(heart_disease$age);max(data_prep_a$age)
##D # remains the same (77) because the max thers for age is 100
##D tukey_outlier(heart_disease$age)
##D 
## End(Not run)



