library(germinationmetrics)


### Name: gcdata
### Title: Germination count data
### Aliases: gcdata
### Keywords: datasets

### ** Examples


data(gcdata)
library(ggplot2)
library(reshape2)

# Plot partial germination counts over time
#----------------------------------------------------------------------------
# Convert wide-from to long-form
gcdatamelt <- melt(gcdata[, !names(gcdata) %in% c("Total Seeds")],
                   id.vars = c("Genotype", "Rep"))

ggplot(gcdatamelt, aes(x = variable, y = value,
                       group = interaction(Genotype, Rep),
                       colour = Genotype)) +
  geom_point(alpha = 0.7) +
  geom_line(alpha = 0.7) +
  ylab("Germination count (Partial)") +
  xlab("Intervals") +
  theme_bw()

# Plot partial germination counts over time
#----------------------------------------------------------------------------

# Convert wide-from to long-form
# Compute cumulative germination counts
gcdata2 <- gcdata
gcdata2[, !names(gcdata2) %in% c("Genotype", "Rep", "Total Seeds")] <-
  t(apply(gcdata2[, !names(gcdata2) %in% c("Genotype", "Rep", "Total Seeds")], 1, cumsum))


gcdatamelt2 <- melt(gcdata2[, !names(gcdata2) %in% c("Total Seeds")],
                    id.vars = c("Genotype", "Rep"))

ggplot(gcdatamelt2, aes(x = variable, y = value,
                        group = interaction(Genotype, Rep),
                        colour = Genotype)) +
  geom_point(alpha = 0.7) +
  geom_line(alpha = 0.7) +
  ylab("Germination count (Cumulative)") +
  xlab("Intervals") +
  theme_bw()

# Compute germination indices
#----------------------------------------------------------------------------

counts.per.intervals <- c("Day01", "Day02", "Day03", "Day04", "Day05",
                          "Day06", "Day07", "Day08", "Day09", "Day10",
                          "Day11", "Day12", "Day13", "Day14")
germination.indices(gcdata, total.seeds.col = "Total Seeds",
                    counts.intervals.cols = counts.per.intervals,
                    intervals = 1:14, partial = TRUE, max.int = 5)




