library(burnr)


### Name: count_event_position
### Title: Count of different events
### Aliases: count_event_position

### ** Examples

data(pgm)
count_event_position(pgm)

# As above, but considering injuries to be a type of event.
count_event_position(pgm, injury_event = TRUE)

# Count only events of a certain position, in this case, "unknown", "early", and "middle".
count_event_position(pgm, injury_event = TRUE, position = c("unknown", "early", "middle"))

# Using custom `groupby` args.
grplist <- list(foo = c("dormant_fs", "early_fs"), bar = c("middle_fs", "late_fs"))
count_event_position(pgm, groupby = grplist)




