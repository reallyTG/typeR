library(gscounts)


### Name: get_calendartime_gsnb
### Title: Calendar time of data looks
### Aliases: get_calendartime_gsnb

### ** Examples

# Calendar time at which 50%, 75%, and 100% of the maximum information is attained
# 100 subjects in each group are recruited uniformly over 1.5 years
# Study ends after two years, i.e. follow-up times vary between 2 and 0.5 years 
get_calendartime_gsnb(rate1 = 0.1, 
                      rate2 = 0.125, 
                      dispersion = 5, 
                      t_recruit1 = seq(0, 1.5, length.out = 100), 
                      t_recruit2 = seq(0, 1.5, length.out = 100),
                      timing = c(0.5, 0.75, 1),
                      followup1 = seq(2, 0.5, length.out = 100),
                      followup2 = seq(2, 0.5, length.out = 100)) 



