library(longitudinalcascade)


### Name: longitudinalcascade
### Title: Longitudinal cascade statistics and charts
### Aliases: longitudinalcascade
### Keywords: cascade longitudinal survival

### ** Examples

# Pull in data from example simulated dataset
library(longitudinalcascade)
data(events_long_cascade_sim)

# Set up options
stages.order <- c("First tested positive","Knows status","Linked to care","Eligible for ART",
"Initiated ART","Therapeutic response")
groups.order <- c("Group 1","Group 2","Group 3")
death.indicator <- "Death"
retention.indicator <- "Clinic visit"
censorship.indicator <- "LTFU"
allow.sub.lines <- TRUE
allow.skips <- TRUE

# Create cascade object
longitudinalcascade.sim <- longitudinalcascade(events_long,stages.order=stages.order,
groups.order=groups.order,death.indicator=death.indicator,
censorship.indicator=censorship.indicator,
allow.sub.lines=allow.sub.lines,allow.skips=allow.skips)

# Print/output main chart
longitudinalcascade.sim$chart
# Output full survival dataset generated, as a data frame
df.longitudainalcascade.survival <- longitudinalcascade.sim$surv.dataset
# Output heterogeneity test
longitudinalcascade.sim$surv.diffs
# Output original long-formatted list of events
df.events.long <- longitudinalcascade.sim$events.long
# Output generated wide-formatted list of events
df.events.wide <- longitudinalcascade.sim$events.wide



