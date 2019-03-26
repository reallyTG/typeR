library(qdapRegex)


### Name: rm_time
### Title: Remove/Replace/Extract Time
### Aliases: rm_time rm_transcript_time as_time as_time2 ex_time
###   ex_transcript_time
### Keywords: time

### ** Examples

x <-  c("R uses 1:5 for 1, 2, 3, 4, 5.", 
    "At 3:00 we'll meet up and leave by 4:30:20",
    "We'll meet at 6:33.", "He ran it in :22.34")

rm_time(x)
ex_time(x)

## With AM/PM
x <- c(
    "I'm getting 3:04 AM just fine, but...",
    "for 10:47 AM I'm getting 0:47 AM instead.",
    "no time here",
    "Some time has 12:04 with no AM/PM after it",
    "Some time has 12:04 a.m. or the form 1:22 pm"
)

ex_time(x)
ex_time(x, pat="@rm_time2")
rm_time(x, pat="@rm_time2")
ex_time(x, pat=pastex("@rm_time2", "@rm_time"))

# Convert to standard format
as_time(ex_time(x))
as_time(ex_time(x), as.POSIXlt = TRUE)
as_time(ex_time(x), as.POSIXlt = FALSE, millisecond = FALSE) 

# Transcript specific time stamps
x2 <-c(
    '08:15 8 minutes and 15 seconds	00:08:15.0',
    '3:15 3 minutes and 15 seconds	not 1:03:15.0',
    '01:22:30 1 hour 22 minutes and 30 seconds	01:22:30.0',
    '#00:09:33-5# 9 minutes and 33.5 seconds	00:09:33.5',
    '00:09.33,75 9 minutes and 33.5 seconds	00:09:33.75'
)

rm_transcript_time(x2)
(out <- ex_transcript_time(x2))

as_time(out)
as_time(out, TRUE)
as_time(out, millisecond = FALSE)

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(chron)
##D lapply(as_time(out), chron::times)
##D lapply(as_time(out, , FALSE), chron::times)
## End(Not run)



