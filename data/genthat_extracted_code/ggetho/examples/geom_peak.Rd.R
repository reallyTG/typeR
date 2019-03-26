library(ggetho)


### Name: geom_peak
### Title: Visualise peaks in a power spectrum or periodogram
### Aliases: geom_peak

### ** Examples

# We make a data frame by hand with five rows
# There are two peaks: in position 4 and 2

df <- data.frame(x = hours(1:5),
                 y = c(1, 2, 0, 4, 1),
                 peak = c(0, 2, 0, 1, 0))
#  We draw the plot as a line
pl <-  ggplot(df, aes(x, y, peak = peak)) +
                  geom_line() +
                  scale_x_hours()
pl
# Now we could add the peak values as an extra layer:
# The first peak
pl + geom_peak()
# The first ans second peak
pl + geom_peak(peak_rank = 1:2)
# The second only
pl + geom_peak(peak_rank = 2)

# Just like with other geoms,
# we can change colour, size, alpha, shape, ... :
pl + geom_peak(colour = "red", size = 10, alpha = .5, shape = 20)

## In the context of circadian analysis,
# Using the zeitgebr package:
## No test: 
require(zeitgebr)
# We make toy data
metadata <- data.table(id = sprintf("toy_experiment|%02d", 1:40),
                       region_id = 1:40,
                       condition = c("A", "B"),
                       sex = c("M", "M", "F", "F"))
dt <- toy_activity_data(metadata, seed = 107)
# We shift period of the group "A" by 0.01
dt[, t := ifelse(xmv(condition) == "A", t, t * 1.01)]
# We  compute a periodogram for each individual
per_dt <- periodogram(moving, dt, FUN = chi_sq_periodogram)
per_dt <- find_peaks(per_dt)
out <- ggperio(per_dt, aes(y = power - signif_threshold, colour = condition, peak = peak)) +
                    stat_pop_etho() +
                    facet_wrap( ~ id, labeller = id_labeller)
out
out + geom_peak(colour="black")
## End(No test)



