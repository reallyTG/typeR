library(mrgsolve)


### Name: ev_days
### Title: Schedule dosing events on days of the week
### Aliases: ev_days

### ** Examples


# Monday, Wednesday, Friday x 4 weeks
ev_days(ev(amt=100), days="m,w,f", addl=3)

# 50 mg Tuesdays, 100 mg Thursdays x 6 months
ev_days(t=ev(amt=50), th=ev(amt=100), addl=23)





