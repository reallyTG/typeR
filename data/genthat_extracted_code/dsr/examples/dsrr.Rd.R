library(dsr)


### Name: dsrr
### Title: Compare Directly Standardized Rates by Ratios or Differences.
### Aliases: dsrr

### ** Examples

#An example of comparing directly standardized rates
#Data from Table 1, Page 132 of Schoenbach (2000)

#State specific death counts and fu
df_study <- data.frame(state=rep(c('Miami',"Alaska"), c(5,5)),
                      age=rep(c('00-14','15-24','25-44','45-64','65+'),2),
                      deaths=c(136,57,208,1016,3605,59,18,37,90,81),
                      fu=c(114350,80259,133440,142670,92168,37164,20036,32693,14947,2077))

#US standard population
df_ref  <- data.frame(age=c('00-14','15-24','25-44','45-64','65+'),
                     pop=c(23961000,15420000,21353000,19601000,10685000))

#Directly Standardized Rate Ratio (per 1000) - 95% log-normal CI's, Alaska as the refernce
my_results2 <- dsrr(data=df_study,
                   event=deaths,
                   fu=fu,
                   subgroup=state,
                   age,
                   refdata=df_ref,
                   refgroup="Alaska",
                   estimate="ratio",
                   sig=0.95,
                   mp=1000,
                   decimals=4)
#View results
my_results2



