library(linbin)


### Name: seq_events
### Title: Generate Sequential Events
### Aliases: seq_events

### ** Examples

e <- events(c(0, 20, 40), c(10, 30, 45))
no.gaps <- event_range(e)
has.gaps <- event_coverage(e)
seq_events(no.gaps, by = 10)                           # unequal length (last is shorter)
seq_events(no.gaps, by = 10, adaptive = TRUE)          # equal length (11.25)
seq_events(no.gaps, length.out = 4)                    # equal length (11.25)
seq_events(has.gaps, length.out = 4, adaptive = FALSE) # equal coverage (11.25), straddling gaps
seq_events(has.gaps, length.out = 4, adaptive = TRUE)  # unequal coverage, fitted to gaps
seq_events(no.gaps, length.out = c(2, 4))              # "group" column added



