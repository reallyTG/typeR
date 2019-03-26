library(dsr)


### Name: dsr
### Title: Compute Directly Standardized Rates
### Aliases: dsr

### ** Examples

#An example of calculating directly standardized rates
#Data from Table 1, Page 132 of Schoenbach (2000)

#State specific death counts and fu
df_study <- data.frame(state=rep(c('Miami',"Alaska"), c(5,5)),
                      age=rep(c('00-14','15-24','25-44','45-64','65+'),2),
                      deaths=c(136,57,208,1016,3605,59,18,37,90,81),
                      fu=c(114350,80259,133440,142670,92168,37164,20036,32693,14947,2077))

#US standard population
df_ref  <- data.frame(age=c('00-14','15-24','25-44','45-64','65+'),
                     pop=c(23961000,15420000,21353000,19601000,10685000))

#Directly Standardized Rates (per 1000) - 95% CI's using the gamma method
my_results <- dsr(data=df_study,
                 event=deaths,
                 fu=fu,
                 subgroup=state,
                 age,
                 refdata=df_ref,
                 method="gamma",
                 sig=0.95,
                 mp=1000,
                 decimals=4)
#View results
my_results



