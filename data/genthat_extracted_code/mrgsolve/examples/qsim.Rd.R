library(mrgsolve)


### Name: qsim
### Title: A quick simulation function
### Aliases: qsim qsim_df

### ** Examples


mod <- mrgsolve:::house()

des <- tgrid(0,2400,1)

data <- recmatrix(ev(amt=1000, ii=24, addl=100),des)

out <- mod %>% qsim(data)




