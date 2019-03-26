library(ggetho)


### Name: ggperio
### Title: Prepare a ggplot object to represent periodogram data
### Aliases: ggperio

### ** Examples

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

# Then we display them as an average
out <- ggperio(per_dt, aes(y = power, colour = condition))
out +  stat_pop_etho()

out <- ggperio(per_dt, aes(y = power - signif_threshold, colour = condition))
out +  stat_pop_etho()
out <- ggperio(per_dt, aes(y = power - signif_threshold, colour = condition))
out +  stat_pop_etho() + facet_wrap( ~ id, labeller = id_labeller)
## End(No test)



