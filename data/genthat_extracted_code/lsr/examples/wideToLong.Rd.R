library(lsr)


### Name: wideToLong
### Title: Reshape from wide to long
### Aliases: wideToLong

### ** Examples

# Outcome measure is mean response time (MRT), measured in two conditions
# with 4 participants. All participants participate in both conditions. 

wide <- data.frame( accuracy_t1 = c( .15,.50,.78,.55 ),  # accuracy at time point 1
                    accuracy_t2 = c( .55,.32,.99,.60 ),  # accuracy at time point 2
                    id = 1:4 )                           # id variable

# convert to long form
wideToLong( wide, "time" )


# A more complex design with multiple within-subject factors. Again, we have only
# four participants, but now we have two different outcome measures, mean response
# time (MRT) and the proportion of correct responses (PC). Additionally, we have two
# different repeated measures variables. As before, we have the experimental condition
# (cond1, cond2), but this time each participant does both conditions on two different
# days (day1, day2). Finally, we have multiple between-subject variables too, namely
# id and gender.

wide2 <- data.frame( id = 1:4,
                     gender = factor( c("male","male","female","female") ),
                     MRT_cond1_day1 = c( 415,500,478,550 ),
                     MRT_cond2_day1 = c( 455,532,499,602 ),
                     MRT_cond1_day2 = c( 400,490,468,502 ),
                     MRT_cond2_day2 = c( 450,518,474,588 ),
                     PC_cond1_day1 = c( 79,83,91,75 ),
                     PC_cond2_day1 = c( 82,86,90,78 ),
                     PC_cond1_day2 = c( 88,92,98,89 ),
                     PC_cond2_day2 = c( 93,97,100,95 ) )

# conversion to long form:
wideToLong( wide2 )
wideToLong( wide2, within = c("condition","day") )

# treat "condition x day" as a single repeated measures variable:
wideToLong( wide2, split = FALSE)




