## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
#Alaska death counts and person-Years by Age and Sex
df_a <- data.frame(age=rep(c('00-14','15-34','35-54','55-74','75+'),2),
                   sex=rep(c('m','f'),c(5,5)),
                   death=c(37,68,206,369,556,78,181,395,555,479),
                   fu=c(81205,93662,108615,35139,5491,77203,85412,100386,32118,7701),
                   state='Alaska'
                   )

#Florida death counts and pearson-years by Age and Sex
df_f <- data.frame(age=rep(c('00-14','15-34','35-54','55-74','75+'),2),
                   sex=rep(c('m','f'),c(5,5)),
                   death=c(1189,2962,10279,26354,42443,906,1234,5630,18309,53489),
                   fu=c(1505889,1972157,2197912,1383533,554632,1445831,1870430,2246737,1612270,868838),
                   state='Florida'
                    )

#Merge state data together
df_all <- rbind(df_a, df_f)

knitr::kable(df_all, caption='State Specific Counts')

#Standard population person-years by Age and Sex
df_pop <- data.frame(age=rep(c('00-14','15-34','35-54','55-74','75+'),2),
                     sex=rep(c('m','f'),c(5,5)),
                     pop=c(30854207,40199647,40945028,19948630,6106351,
                           29399168,38876268,41881451,22717040,10494416)
                     )

knitr::kable(df_pop, caption='US Person-Years')


## ------------------------------------------------------------------------
library(dsr)
my_results <- dsr(data=df_all,
                  event=death,
                  fu=fu,
                  subgroup=state,
                  age, sex,
                  refdata=df_pop,
                  method="gamma",
                  sig=0.95,
                  mp=1000,
                  decimals=4)

knitr::kable(my_results)

## ------------------------------------------------------------------------
my_results <- dsrr(data=df_all,
                   event=death,
                   fu=fu,
                   subgroup=state,
                   age, sex,
                   refdata=df_pop,
                   refgroup="Florida",
                   estimate="ratio",
                   sig=0.95,
                   mp=1000,
                   decimals=4)

knitr::kable(my_results)

## ------------------------------------------------------------------------
my_results2 <- dsrr(data=df_all,
                   event=death,
                   fu=fu,
                   subgroup=state,
                   age, sex,
                   refdata=df_pop,
                   refgroup="Florida",
                   estimate="difference",
                   sig=0.95,
                   mp=1000,
                   decimals=4)

knitr::kable(my_results2)

