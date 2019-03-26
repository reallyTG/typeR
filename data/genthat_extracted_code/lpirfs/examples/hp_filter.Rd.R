library(lpirfs)


### Name: hp_filter
### Title: Decompose a times series via the Hodrick-Prescott filter
### Aliases: hp_filter

### ** Examples

## No test: 
library(lpirfs)


# Decompose the Federal Funds Rate
 data_set     <- as.matrix(interest_rules_var_data$FF)
 hp_results   <- hp_filter(data_set, 1600)

# Extract results and save as data.frame
 hp_cyc    <- as.data.frame(hp_results[[1]])
 hp_trend  <- as.data.frame(hp_results[[2]])

# Make data.frames for plots
 cyc_df     <- data.frame(yy = hp_cyc$V1,   xx = seq(as.Date('1955-01-01'),
                            as.Date('2003-01-01') , "quarter"))
 trend_df   <- data.frame(yy = hp_trend$V1, xx = seq(as.Date('1955-01-01'),
                            as.Date('2003-01-01') , "quarter"))

# Make plots
 library(ggplot2)

# Plot cyclical part
 ggplot(data = cyc_df) +
 geom_line(aes(y = yy, x = xx))

# Plot trend component
 ggplot(trend_df) +
 geom_line(aes(y = yy, x = xx))

## End(No test)



